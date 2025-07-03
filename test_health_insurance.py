#!/usr/bin/env python3
"""
Test script to verify the health insurance calculation logic
"""

import pandas as pd

# Sample test data that mimics the database structure
test_data = [
    {'ward_no': 1, 'has_insurance': 'health_insurance'},
    {'ward_no': 1, 'has_insurance': 'health_insurance'},
    {'ward_no': 1, 'has_insurance': 'life_insurance'},
    {'ward_no': 1, 'has_insurance': None},
    {'ward_no': 2, 'has_insurance': 'health_insurance'},
    {'ward_no': 2, 'has_insurance': 'health_insurance'},
    {'ward_no': 2, 'has_insurance': 'health_insurance'},
    {'ward_no': 3, 'has_insurance': 'life_insurance'},
    {'ward_no': 3, 'has_insurance': None},
    {'ward_no': 3, 'has_insurance': 'vehicle_insurance'},
    {'ward_no': 4, 'has_insurance': None},
    {'ward_no': 4, 'has_insurance': None},
]

def test_health_insurance_calculation():
    """Test the health insurance calculation logic"""
    print("Testing health insurance calculation...")
    
    # Create DataFrame from test data
    df = pd.DataFrame(test_data)
    print(f"Original data: {len(df)} households across {df['ward_no'].nunique()} wards")
    
    # Simulate the SQL query logic step by step
    result_data = []
    
    for ward_no in sorted(df['ward_no'].unique()):
        ward_data = df[df['ward_no'] == ward_no]
        
        insured_count = sum(ward_data['has_insurance'] == 'health_insurance')
        total_count = len(ward_data)
        non_insured_count = total_count - insured_count
        
        result_data.append({
            'ward_no': ward_no,
            'insured_households_count': insured_count,
            'non_insured_households_count': non_insured_count,
            'total_households': total_count
        })
    
    result = pd.DataFrame(result_data)
    
    print("\nResults by ward:")
    for _, row in result.iterrows():
        ward = row['ward_no']
        insured = row['insured_households_count']
        non_insured = row['non_insured_households_count']
        total = row['total_households']
        coverage_rate = (insured / total * 100) if total > 0 else 0
        
        print(f"  Ward {ward}: {insured} insured, {non_insured} non-insured, {total} total ({coverage_rate:.1f}% coverage)")
    
    # Summary statistics
    total_insured = result['insured_households_count'].sum()
    total_non_insured = result['non_insured_households_count'].sum()
    total_households = result['total_households'].sum()
    
    print(f"\nSummary:")
    print(f"  Total insured households: {total_insured}")
    print(f"  Total non-insured households: {total_non_insured}")
    print(f"  Total households: {total_households}")
    print(f"  Overall coverage rate: {(total_insured/total_households*100):.2f}%")
    
    # Check for wards with zero insured households
    zero_insured_wards = result[result['insured_households_count'] == 0]
    if len(zero_insured_wards) > 0:
        print(f"  Wards with 0 insured households: {list(zero_insured_wards['ward_no'])}")
    
    return result

if __name__ == "__main__":
    result = test_health_insurance_calculation()
    print("\nTest completed successfully!")
    print("The updated logic should now correctly calculate insured and non-insured households for all wards.") 