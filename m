Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8732527B05E
	for <lists.virtualization@lfdr.de>; Mon, 28 Sep 2020 16:56:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3C40185CD5;
	Mon, 28 Sep 2020 14:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lBWZuhJD5-6F; Mon, 28 Sep 2020 14:56:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6537885C88;
	Mon, 28 Sep 2020 14:56:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33C2CC0051;
	Mon, 28 Sep 2020 14:56:26 +0000 (UTC)
X-Original-To: virtualization@lists.linuxfoundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15E0BC0051
 for <virtualization@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 14:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 04B00851FB
 for <virtualization@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 14:56:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XpfRsUlf4d87
 for <virtualization@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 14:56:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DB10484961
 for <virtualization@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 14:56:23 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a9so1483848wmm.2
 for <virtualization@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 07:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=Hgo0RKH7kfv/VZXAyKSjnZwmz0wK7Kq2I6jTccm7HsI=;
 b=RVNazbaRa/pZo8NJ4yYb1ufCc7zojO9HqwnMzPUJUpiGfescBV2zi3idKQyvZ8omW2
 0npFjuDjHqpSs1Z6INq2SfpW4g0nFkecNYT21zOEYqakNwLWix/i5z53UYqemwrNInXb
 +tYDKXnxpe1PL11ZPd+eKy4P6CqrVNiF8fatElmlUjOWeKj94lMvYEpDgx/0H6UFosFJ
 y1ffOPi8IrbDYvtPgPzvUh8lyeRfi4GSWg2kd7kGHN4OgiJByiB4iv8mUm3TTKmPEJKa
 tDA0lJf+rQmVJvAV9cfw8OwxUR6zCt6dpHe85d1tJvgJ9ayd2mKu0KDG1bbTfOjqWNTV
 o+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=Hgo0RKH7kfv/VZXAyKSjnZwmz0wK7Kq2I6jTccm7HsI=;
 b=sk4NkHAvUoaumv+eWtDCUMS1epknXbj9S7g6AZ/C6cIoaNbbl0+xXuj6dg8ITszis/
 VqZKRiiWAm6hS7PUH0WLPt/8hvCgDcdyWKNDi/0hB+oG7niqzIlFhfo2neQEJ3/FD7C7
 5r2xNK1VHaefmXy6IIIOd8un1XEz8Ia69PS7lRDWPeWrztd9mT/mO7wJmTfc1WRcPlaN
 0kcAuK23mTDcKiZV/Ipl50YKsoa8ZD6X4UuMgFANBNy5EMhcNWN+5DlDzVYlmhGc/7C6
 n+GmavpQa1J0nojMZzO5b9kJifU6YZX1WRNAUufKc7nrtoXd65BfBmrqEcKlbJ2uy/D3
 Iu7Q==
X-Gm-Message-State: AOAM531wGFZW0jnMYqnF3ELFCedhpgxriMhPhiNOGAuG6euHYKnKY0FC
 CSShTVza/4ue7eEcxj18akQysw==
X-Google-Smtp-Source: ABdhPJwbZ/8+xJ+thp9Tr9tVsaTVTYfpmESj1Rlgm4ma6QsNnTigPc5bhAady8L09l84lgirDPxyIg==
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr2157894wml.25.1601304982238; 
 Mon, 28 Sep 2020 07:56:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 88sm1955595wrl.76.2020.09.28.07.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 07:56:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 428B71FF7E;
 Mon, 28 Sep 2020 15:56:19 +0100 (BST)
References: <20200925125147.26943-1-alex.bennee@linaro.org>
 <20200925125147.26943-16-alex.bennee@linaro.org>
 <20200928135201.GA9143@goby>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Joakim Bech <joakim.bech@linaro.org>
Subject: Re: [RFC PATCH  15/19] tools/vhost-user-rpmb: implement
 VIRTIO_RPMB_REQ_DATA_WRITE
In-reply-to: <20200928135201.GA9143@goby>
Date: Mon, 28 Sep 2020 15:56:19 +0100
Message-ID: <875z7yq7ak.fsf@linaro.org>
MIME-Version: 1.0
Cc: jean-philippe@linaro.org, maxim.uvarov@linaro.org, bing.zhu@intel.com,
 Matti.Moell@opensynergy.com, virtualization@lists.linuxfoundation.org,
 ilias.apalodimas@linaro.org, qemu-devel@nongnu.org, arnd@linaro.org,
 takahiro.akashi@linaro.org, tomas.winkler@intel.com,
 stratos-dev@op-lists.linaro.org, hmo@opensynergy.com, yang.huang@intel.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CkpvYWtpbSBCZWNoIDxqb2FraW0uYmVjaEBsaW5hcm8ub3JnPiB3cml0ZXM6Cgo+IE9uIEZyaSwg
U2VwIDI1LCAyMDIwIGF0IDAxOjUxOjQzUE0gKzAxMDAsIEFsZXggQmVubsOpZSB3cm90ZToKPj4g
V2l0aCB0aGlzIGNvbW1hbmQgd2UgYXJlIGZpbmFsbHkgdXBkYXRpbmcgZGF0YSB0byB0aGUgYmFj
a2luZyBzdG9yZQo+PiBhbmQgY3ljbGluZyB0aGUgd3JpdGVfY291bnQgYW5kIGVhY2ggc3VjY2Vz
c2Z1bCB3cml0ZS4gV2UgYWxzbyBpbmNsdWRlCj4+IHRoZSB3cml0ZSBjb3VudCBpbiBhbGwgcmVz
cG9uc2UgZnJhbWVzIGFzIHRoZSBzcGVjIGlzIGEgbGl0dGxlIHVuY2xlYXIKPj4gYnV0IHRoZSBl
eGFtcGxlIHRlc3QgY29kZSBleHBlY3RlZCBpdC4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFsZXgg
QmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KPj4gLS0tCj4+ICB0b29scy92aG9zdC11
c2VyLXJwbWIvbWFpbi5jIHwgMTExICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
Cj4+ICAxIGZpbGUgY2hhbmdlZCwgMTA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4+
IAo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvdmhvc3QtdXNlci1ycG1iL21haW4uYyBiL3Rvb2xzL3Zo
b3N0LXVzZXItcnBtYi9tYWluLmMKPj4gaW5kZXggODg3NDdjNTBmYTQ0Li5hMTdjM2I0YmNjNGUg
MTAwNjQ0Cj4+IC0tLSBhL3Rvb2xzL3Zob3N0LXVzZXItcnBtYi9tYWluLmMKPj4gKysrIGIvdG9v
bHMvdmhvc3QtdXNlci1ycG1iL21haW4uYwo+PiBAQCAtNjIsNiArNjIsNyBAQCBlbnVtIHsKPj4g
ICNkZWZpbmUgS2lCICAgICAoMVVMIDw8IDEwKQo+PiAgI2RlZmluZSBNQVhfUlBNQl9TSVpFIChL
aUIgKiAxMjggKiAyNTYpCj4+ICAjZGVmaW5lIFJQTUJfS0VZX01BQ19TSVpFIDMyCj4+ICsjZGVm
aW5lIFJQTUJfQkxPQ0tfU0laRSAyNTYKPj4gIAo+PiAgLyogUlBNQiBSZXF1ZXN0IFR5cGVzICov
Cj4+ICAjZGVmaW5lIFZJUlRJT19SUE1CX1JFUV9QUk9HUkFNX0tFWSAgICAgICAgMHgwMDAxCj4+
IEBAIC0xMDAsNyArMTAxLDcgQEAgc3RydWN0IHZpcnRpb19ycG1iX2NvbmZpZyB7Cj4+ICBzdHJ1
Y3QgdmlydGlvX3JwbWJfZnJhbWUgewo+PiAgICAgIHVpbnQ4X3Qgc3R1ZmZbMTk2XTsKPj4gICAg
ICB1aW50OF90IGtleV9tYWNbUlBNQl9LRVlfTUFDX1NJWkVdOwo+PiAtICAgIHVpbnQ4X3QgZGF0
YVsyNTZdOwo+PiArICAgIHVpbnQ4X3QgZGF0YVtSUE1CX0JMT0NLX1NJWkVdOwo+PiAgICAgIHVp
bnQ4X3Qgbm9uY2VbMTZdOwo+PiAgICAgIC8qIHJlbWFpbmluZyBmaWVsZHMgYXJlIGJpZy1lbmRp
YW4gKi8KPj4gICAgICB1aW50MzJfdCB3cml0ZV9jb3VudGVyOwo+PiBAQCAtMTI0LDYgKzEyNSw3
IEBAIHR5cGVkZWYgc3RydWN0IFZ1UnBtYiB7Cj4+ICAgICAgdWludDhfdCAgbGFzdF9ub25jZVsx
Nl07Cj4+ICAgICAgdWludDE2X3QgbGFzdF9yZXN1bHQ7Cj4+ICAgICAgdWludDE2X3QgbGFzdF9y
ZXFyZXNwOwo+PiArICAgIHVpbnQxNl90IGxhc3RfYWRkcmVzczsKPj4gICAgICB1aW50MzJfdCB3
cml0ZV9jb3VudDsKPj4gIH0gVnVScG1iOwo+PiAgCj4+IEBAIC0yMzksMTcgKzI0MSwzMCBAQCB2
cnBtYl9zZXRfY29uZmlnKFZ1RGV2ICpkZXYsIGNvbnN0IHVpbnQ4X3QgKmRhdGEsCj4+ICAgKiB3
aGljaCBpdHNlbGYgdXNlcyBhIDMgY2xhdXNlIEJTRCBjaHVuayBvZiBjb2RlLgo+PiAgICovCj4+
ICAKPj4gK3N0YXRpYyBjb25zdCBpbnQgcnBtYl9mcmFtZV9kbGVuID0gKHNpemVvZihzdHJ1Y3Qg
dmlydGlvX3JwbWJfZnJhbWUpIC0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG9mZnNldG9mKHN0cnVjdCB2aXJ0aW9fcnBtYl9mcmFtZSwgZGF0YSkpOwo+PiArCj4+ICBz
dGF0aWMgdm9pZCB2cnBtYl91cGRhdGVfbWFjX2luX2ZyYW1lKFZ1UnBtYiAqciwgc3RydWN0IHZp
cnRpb19ycG1iX2ZyYW1lICpmcm0pCj4+ICB7Cj4+ICAgICAgaG1hY19zaGEyNTZfY3R4IGN0eDsK
Pj4gLSAgICBzdGF0aWMgY29uc3QgaW50IGRsZW4gPSAoc2l6ZW9mKHN0cnVjdCB2aXJ0aW9fcnBt
Yl9mcmFtZSkgLQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvZmZzZXRvZihzdHJ1
Y3QgdmlydGlvX3JwbWJfZnJhbWUsIGRhdGEpKTsKPj4gIAo+PiAgICAgIGhtYWNfc2hhMjU2X2lu
aXQoJmN0eCwgci0+a2V5LCBSUE1CX0tFWV9NQUNfU0laRSk7Cj4+IC0gICAgaG1hY19zaGEyNTZf
dXBkYXRlKCZjdHgsIGZybS0+ZGF0YSwgZGxlbik7Cj4+ICsgICAgaG1hY19zaGEyNTZfdXBkYXRl
KCZjdHgsIGZybS0+ZGF0YSwgcnBtYl9mcmFtZV9kbGVuKTsKPj4gICAgICBobWFjX3NoYTI1Nl9m
aW5hbCgmY3R4LCAmZnJtLT5rZXlfbWFjWzBdLCAzMik7Cj4+ICB9Cj4+ICAKPj4gK3N0YXRpYyBi
b29sIHZycG1iX3ZlcmlmeV9tYWNfaW5fZnJhbWUoVnVScG1iICpyLCBzdHJ1Y3QgdmlydGlvX3Jw
bWJfZnJhbWUgKmZybSkKPj4gK3sKPj4gKyAgICBobWFjX3NoYTI1Nl9jdHggY3R4Owo+PiArICAg
IHVpbnQ4X3QgY2FsY3VsYXRlZF9tYWNbUlBNQl9LRVlfTUFDX1NJWkVdOwo+PiArCj4+ICsgICAg
aG1hY19zaGEyNTZfaW5pdCgmY3R4LCByLT5rZXksIFJQTUJfS0VZX01BQ19TSVpFKTsKPj4gKyAg
ICBobWFjX3NoYTI1Nl91cGRhdGUoJmN0eCwgZnJtLT5kYXRhLCBycG1iX2ZyYW1lX2RsZW4pOwo+
PiArICAgIGhtYWNfc2hhMjU2X2ZpbmFsKCZjdHgsIGNhbGN1bGF0ZWRfbWFjLCBSUE1CX0tFWV9N
QUNfU0laRSk7Cj4+ICsKPj4gKyAgICByZXR1cm4gbWVtY21wKGNhbGN1bGF0ZWRfbWFjLCBmcm0t
PmtleV9tYWMsIFJQTUJfS0VZX01BQ19TSVpFKSA9PSAwOwo+Pgo+IEknZCBwcmVmZXIgdXNpbmcg
YSBjb25zdGFudCB0aW1lIGNvbXBhcmlzb24gZnVuY3Rpb24gZm9yIHRoaXMgb25lCj4gaW5zdGVh
ZCBvZiBtZW1jbXAgKHJlZ2FyZGxlc3MgaWYgaXQncyB1c2VkIGZvciBzaW11bGF0aW9uIG9yIG5v
dCkgdG8KPiBwcmV2ZW50IGV2ZW50dWFsIHRpbWluZyBhdHRhY2tzLgoKQ291bGQgeW91IHJlY29t
bWVuZCBzdWNoIGEgZnVuY3Rpb24gZm9yIHRoaXM/Cgo+Cj4+ICt9Cj4+ICsKPj4gIC8qCj4+ICAg
KiBIYW5kbGVycyBmb3IgaW5kaXZpZHVhbCBjb250cm9sIG1lc3NhZ2VzCj4+ICAgKi8KPj4gQEAg
LTMyNCw2ICszMzksODIgQEAgdnJwbWJfaGFuZGxlX2dldF93cml0ZV9jb3VudGVyKFZ1RGV2ICpk
ZXYsIHN0cnVjdCB2aXJ0aW9fcnBtYl9mcmFtZSAqZnJhbWUpCj4+ICAgICAgcmV0dXJuIHJlc3A7
Cj4+ICB9Cj4+ICAKPj4gKy8qCj4+ICsgKiB2cnBtYl9oYW5kbGVfd3JpdGU6Cj4+ICsgKgo+PiAr
ICogV2Ugd2lsbCByZXBvcnQgdGhlIHN1Y2Nlc3MvZmFpbCBvbiByZWNlaXB0IG9mCj4+ICsgKiBW
SVJUSU9fUlBNQl9SRVFfUkVTVUxUX1JFQUQuIFJldHVybnMgdGhlIG51bWJlciBvZiBleHRyYSBm
cmFtZXMKPj4gKyAqIHByb2Nlc3NlZCBpbiB0aGUgcmVxdWVzdC4KPj4gKyAqLwo+PiArc3RhdGlj
IGludCB2cnBtYl9oYW5kbGVfd3JpdGUoVnVEZXYgKmRldiwgc3RydWN0IHZpcnRpb19ycG1iX2Zy
YW1lICpmcmFtZSkKPj4gK3sKPj4gKyAgICBWdVJwbWIgKnIgPSBjb250YWluZXJfb2YoZGV2LCBW
dVJwbWIsIGRldi5wYXJlbnQpOwo+PiArICAgIGludCBleHRyYV9mcmFtZXMgPSAwOwo+PiArICAg
IHVpbnQxNl90IGJsb2NrX2NvdW50ID0gYmUxNnRvaChmcmFtZS0+YmxvY2tfY291bnQpOwo+PiAr
ICAgIHVpbnQzMl90IHdyaXRlX2NvdW50ZXIgPSBiZTMydG9oKGZyYW1lLT53cml0ZV9jb3VudGVy
KTsKPj4gKyAgICBzaXplX3Qgb2Zmc2V0Owo+PiArCj4+ICsgICAgci0+bGFzdF9yZXFyZXNwID0g
VklSVElPX1JQTUJfUkVTUF9EQVRBX1dSSVRFOwo+PiArICAgIHItPmxhc3RfYWRkcmVzcyA9IGJl
MTZ0b2goZnJhbWUtPmFkZHJlc3MpOwo+PiArICAgIG9mZnNldCA9ICByLT5sYXN0X2FkZHJlc3Mg
KiBSUE1CX0JMT0NLX1NJWkU7Cj4+ICsKPj4gKyAgICAvKgo+PiArICAgICAqIFJ1biB0aGUgY2hl
Y2tzIGZyb206Cj4+ICsgICAgICogNS4xMi42LjEuMyBEZXZpY2UgUmVxdWlyZW1lbnRzOiBEZXZp
Y2UgT3BlcmF0aW9uOiBEYXRhIFdyaXRlCj4+ICsgICAgICovCj4+ICsgICAgaWYgKCFyLT5rZXkp
IHsKPj4gKyAgICAgICAgZ193YXJuaW5nKCJubyBrZXkgcHJvZ3JhbW1lZCIpOwo+PiArICAgICAg
ICByLT5sYXN0X3Jlc3VsdCA9IFZJUlRJT19SUE1CX1JFU19OT19BVVRIX0tFWTsKPj4gKyAgICB9
IGVsc2UgaWYgKGJsb2NrX2NvdW50ID09IDAgfHwKPj4gKyAgICAgICAgICAgICAgIGJsb2NrX2Nv
dW50ID4gci0+dmlydGlvX2NvbmZpZy5tYXhfd3JfY250KSB7Cj4+ICsgICAgICAgIHItPmxhc3Rf
cmVzdWx0ID0gVklSVElPX1JQTUJfUkVTX0dFTkVSQUxfRkFJTFVSRTsKPj4gKyAgICB9IGVsc2Ug
aWYgKGZhbHNlIC8qIHdoYXQgZG9lcyBhbiBleHBpcmVkIHdyaXRlIGNvdW50ZXIgbWVhbj8gKi8p
IHsKPj4KPiBJSVJDLCB0aGUgY291bnRlciBoYXMgcm9vbSBmb3IgYSAzMi1iaXQgdmFsdWUgYW5k
IHRoZSBjb3VudGVyIHdpbGwgbmV2ZXIKPiB3cmFwIGFyb3VuZC4gU28gb25jZSB0aGUgY291bnRl
ciBoYXZlIHJlYWNoZWQgbWF4IGZvciB1aW50MzJfdCwgdGhlbgo+IHRoZXJlIGlzIGFuIGFkZGl0
aW9uYWwgYml0IHNldCAocGVybWFuZW50bHkpIGluIHRoZSBvcGVyYXRpb24gcmVzdWx0Lgo+IEku
ZS4sIHdyaXRlcyBhcmUgbm8gbG9uZ2VyIHBvc3NpYmxlIG9uY2UgdGhhdCBoYXMgaGFwcGVuZWQu
IFRoYXQgaXMKPiBwcm9iYWJseSB3aGF0IHlvdSdyZSByZWZlcnJpbmcgdG8gaGVyZSBJIHN1cHBv
c2UuCgpUaGF0IHdvdWxkIG1ha2Ugc2Vuc2UuIEknbGwgc2VlIGlmIEkgY2FuIG1ha2UgdGhlIHNw
ZWMgbGFuZ3VhZ2UgYSBiaXQKY2xlYXJlciBhcyB3ZWxsLgoKPgo+PiArICAgICAgICByLT5sYXN0
X3Jlc3VsdCA9IFZJUlRJT19SUE1CX1JFU19XUklURV9DT1VOVEVSX0VYUElSRUQ7Cj4+ICsgICAg
fSBlbHNlIGlmIChvZmZzZXQgPiAoci0+dmlydGlvX2NvbmZpZy5jYXBhY2l0eSAqICgxMjggKiBL
aUIpKSkgewo+PiArICAgICAgICByLT5sYXN0X3Jlc3VsdCA9IFZJUlRJT19SUE1CX1JFU19BRERS
X0ZBSUxVUkU7Cj4+ICsgICAgfSBlbHNlIGlmICghdnJwbWJfdmVyaWZ5X21hY19pbl9mcmFtZShy
LCBmcmFtZSkpIHsKPj4gKyAgICAgICAgci0+bGFzdF9yZXN1bHQgPSBWSVJUSU9fUlBNQl9SRVNf
QVVUSF9GQUlMVVJFOwo+PiArICAgIH0gZWxzZSBpZiAod3JpdGVfY291bnRlciAhPSByLT53cml0
ZV9jb3VudCkgewo+PiArICAgICAgICByLT5sYXN0X3Jlc3VsdCA9IFZJUlRJT19SUE1CX1JFU19D
T1VOVF9GQUlMVVJFOwo+PiArICAgIH0gZWxzZSB7Cj4+ICsgICAgICAgIGludCBpOwo+PiArICAg
ICAgICAvKiBBdCB0aGlzIHBvaW50IHdlIGhhdmUgYSB2YWxpZCBhdXRoZW50aWNhdGVkIHdyaXRl
IHJlcXVlc3QKPj4gKyAgICAgICAgICogc28gdGhlIGNvdW50ZXIgY2FuIGluY3JlbWVudGVkIGFu
ZCB3ZSBjYW4gYXR0ZW1wdCB0bwo+PiArICAgICAgICAgKiB1cGRhdGUgdGhlIGJhY2tpbmcgZGV2
aWNlLgo+PiArICAgICAgICAgKi8KPj4gKyAgICAgICAgci0+d3JpdGVfY291bnQrKzsKPj4gKyAg
ICAgICAgZm9yIChpID0gMDsgaSA8IGJsb2NrX2NvdW50OyBpKyspIHsKPj4gKyAgICAgICAgICAg
IHZvaWQgKmJsayA9IHItPmZsYXNoX21hcCArIG9mZnNldDsKPj4gKyAgICAgICAgICAgIGdfZGVi
dWcoIiVzOiB3cml0aW5nIGJsb2NrICVkIiwgX19mdW5jX18sIGkpOwo+PiArICAgICAgICAgICAg
aWYgKG1wcm90ZWN0KGJsaywgUlBNQl9CTE9DS19TSVpFLCBQUk9UX1dSSVRFKSAhPSAwKSB7Cj4+
ICsgICAgICAgICAgICAgICAgci0+bGFzdF9yZXN1bHQgPSAgVklSVElPX1JQTUJfUkVTX1dSSVRF
X0ZBSUxVUkU7Cj4+ICsgICAgICAgICAgICAgICAgYnJlYWs7Cj4+ICsgICAgICAgICAgICB9Cj4+
ICsgICAgICAgICAgICBtZW1jcHkoYmxrLCBmcmFtZVtpXS5kYXRhLCBSUE1CX0JMT0NLX1NJWkUp
Owo+PiArICAgICAgICAgICAgaWYgKG1zeW5jKGJsaywgUlBNQl9CTE9DS19TSVpFLCBNU19TWU5D
KSAhPSAwKSB7Cj4+ICsgICAgICAgICAgICAgICAgZ193YXJuaW5nKCIlczogZmFpbGVkIHRvIHN5
bmMgdXBkYXRlIiwgX19mdW5jX18pOwo+PiArICAgICAgICAgICAgICAgIHItPmxhc3RfcmVzdWx0
ID0gVklSVElPX1JQTUJfUkVTX1dSSVRFX0ZBSUxVUkU7Cj4+ICsgICAgICAgICAgICAgICAgYnJl
YWs7Cj4+ICsgICAgICAgICAgICB9Cj4+ICsgICAgICAgICAgICBpZiAobXByb3RlY3QoYmxrLCBS
UE1CX0JMT0NLX1NJWkUsIFBST1RfUkVBRCkgIT0gMCkgewo+PiArICAgICAgICAgICAgICAgIGdf
d2FybmluZygiJXM6IGZhaWxlZCB0byByZS1hcHBseSByZWFkIHByb3RlY3Rpb24iLCBfX2Z1bmNf
Xyk7Cj4+ICsgICAgICAgICAgICAgICAgci0+bGFzdF9yZXN1bHQgPSBWSVJUSU9fUlBNQl9SRVNf
R0VORVJBTF9GQUlMVVJFOwo+PiArICAgICAgICAgICAgICAgIGJyZWFrOwo+PiArICAgICAgICAg
ICAgfQo+PiArICAgICAgICAgICAgb2Zmc2V0ICs9IFJQTUJfQkxPQ0tfU0laRTsKPj4gKyAgICAg
ICAgfQo+PiArICAgICAgICByLT5sYXN0X3Jlc3VsdCA9IFZJUlRJT19SUE1CX1JFU19PSzsKPj4g
KyAgICAgICAgZXh0cmFfZnJhbWVzID0gaSAtIDE7Cj4+ICsgICAgfQo+PiArCj4+ICsgICAgZ19p
bmZvKCIlczogJXMgKCV4LCAlZCBleHRyYSBmcmFtZXMgcHJvY2Vzc2VkKSwgd3JpdGVfY291bnQ9
JWQiLCBfX2Z1bmNfXywKPj4gKyAgICAgICAgICAgci0+bGFzdF9yZXN1bHQgPT0gVklSVElPX1JQ
TUJfUkVTX09LID8gInN1Y2Nlc3NmdWwiOiJmYWlsZWQiLAo+PiArICAgICAgICAgICByLT5sYXN0
X3Jlc3VsdCwgZXh0cmFfZnJhbWVzLCByLT53cml0ZV9jb3VudCk7Cj4+ICsKPj4gKyAgICByZXR1
cm4gZXh0cmFfZnJhbWVzOwo+PiArfQo+PiArCj4+ICsKPj4gIC8qCj4+ICAgKiBSZXR1cm4gdGhl
IHJlc3VsdCBvZiB0aGUgbGFzdCBtZXNzYWdlLiBUaGlzIGlzIG9ubHkgdmFsaWQgaWYgdGhlCj4+
ICAgKiBwcmV2aW91cyBtZXNzYWdlIHdhcyBWSVJUSU9fUlBNQl9SRVFfUFJPR1JBTV9LRVkgb3IK
Pj4gQEAgLTMzOSwxMCArNDMwLDE0IEBAIHN0YXRpYyBzdHJ1Y3QgdmlydGlvX3JwbWJfZnJhbWUg
KiB2cnBtYl9oYW5kbGVfcmVzdWx0X3JlYWQoVnVEZXYgKmRldikKPj4gICAgICBnX2luZm8oIiVz
OiBmb3IgcmVxdWVzdDoleCByZXN1bHQ6JXgiLCBfX2Z1bmNfXywKPj4gICAgICAgICAgICAgci0+
bGFzdF9yZXFyZXNwLCByLT5sYXN0X3Jlc3VsdCk7Cj4+ICAKPj4gLSAgICBpZiAoci0+bGFzdF9y
ZXFyZXNwID09IFZJUlRJT19SUE1CX1JFU1BfUFJPR1JBTV9LRVkgfHwKPj4gLSAgICAgICAgci0+
bGFzdF9yZXFyZXNwID09IFZJUlRJT19SUE1CX1JFUV9EQVRBX1dSSVRFKSB7Cj4+ICsgICAgaWYg
KHItPmxhc3RfcmVxcmVzcCA9PSBWSVJUSU9fUlBNQl9SRVNQX1BST0dSQU1fS0VZKSB7Cj4+ICAg
ICAgICAgIHJlc3AtPnJlc3VsdCA9IGh0b2JlMTYoci0+bGFzdF9yZXN1bHQpOwo+PiAgICAgICAg
ICByZXNwLT5yZXFfcmVzcCA9IGh0b2JlMTYoci0+bGFzdF9yZXFyZXNwKTsKPj4gKyAgICB9IGVs
c2UgaWYgKHItPmxhc3RfcmVxcmVzcCA9PSBWSVJUSU9fUlBNQl9SRVNQX0RBVEFfV1JJVEUpIHsK
Pj4gKyAgICAgICAgcmVzcC0+cmVzdWx0ID0gaHRvYmUxNihyLT5sYXN0X3Jlc3VsdCk7Cj4+ICsg
ICAgICAgIHJlc3AtPnJlcV9yZXNwID0gaHRvYmUxNihyLT5sYXN0X3JlcXJlc3ApOwo+PiArICAg
ICAgICByZXNwLT53cml0ZV9jb3VudGVyID0gaHRvYmUzMihyLT53cml0ZV9jb3VudCk7Cj4+ICsg
ICAgICAgIHJlc3AtPmFkZHJlc3MgPSBodG9iZTE2KHItPmxhc3RfYWRkcmVzcyk7Cj4+ICAgICAg
fSBlbHNlIHsKPj4gICAgICAgICAgcmVzcC0+cmVzdWx0ID0gaHRvYmUxNihWSVJUSU9fUlBNQl9S
RVNfR0VORVJBTF9GQUlMVVJFKTsKPj4gICAgICB9Cj4+IEBAIC00NDUsNiArNTQwLDEwIEBAIHZy
cG1iX2hhbmRsZV9jdHJsKFZ1RGV2ICpkZXYsIGludCBxaWR4KQo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgX19mdW5jX18pOwo+PiAgICAgICAgICAgICAgICAgIH0KPj4gICAgICAg
ICAgICAgICAgICBicmVhazsKPj4gKyAgICAgICAgICAgIGNhc2UgVklSVElPX1JQTUJfUkVRX0RB
VEFfV1JJVEU6Cj4+ICsgICAgICAgICAgICAgICAgLyogd2UgY2FuIGhhdmUgbXVsdGlwbGUgYmxv
Y2tzIGhhbmRsZWQgKi8KPj4gKyAgICAgICAgICAgICAgICBuICs9IHZycG1iX2hhbmRsZV93cml0
ZShkZXYsIGYpOwo+PiArICAgICAgICAgICAgICAgIGJyZWFrOwo+PiAgICAgICAgICAgICAgZGVm
YXVsdDoKPj4gICAgICAgICAgICAgICAgICBnX2RlYnVnKCJ1bi1oYW5kbGVkIHJlcXVlc3Q6ICV4
IiwgZi0+cmVxX3Jlc3ApOwo+PiAgICAgICAgICAgICAgICAgIGJyZWFrOwo+PiAtLSAKPj4gMi4y
MC4xCj4+IAoKVGhhbmtzIQoKLS0gCkFsZXggQmVubsOpZQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmly
dHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
