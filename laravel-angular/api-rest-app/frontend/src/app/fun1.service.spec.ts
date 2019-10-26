import { TestBed } from '@angular/core/testing';

import { Fun1Service } from './fun1.service';

describe('Fun1Service', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: Fun1Service = TestBed.get(Fun1Service);
    expect(service).toBeTruthy();
  });
});
