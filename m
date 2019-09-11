Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BB0AF912
	for <lists.virtualization@lfdr.de>; Wed, 11 Sep 2019 11:37:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D97A31ABC;
	Wed, 11 Sep 2019 09:36:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 141051AB6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 09:36:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7250A83A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 09:36:57 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
	[209.85.160.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2ED7CA377
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 09:36:56 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id y13so23061394qtn.6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 02:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=Pl8aywfJEsNYEX8Cjmv4sK/xJV1YVyk6NPEurxInDFs=;
	b=fObWUZchZhJ2zlAr2te1KORW9yCrTub/lm0vBfeurueX648pk8royMDl3jzO7yDlcs
	N08ckcePASQDkha2q1a2PF7IgXHhipu7ErNB3fXdHWz+KbYbYwuL3LzhBQYSSB1tkCpa
	vEYA2Z59kVS4rNS0ksSSCJ3vF4jeY/Sh7Pkh4xAKAM8NOYwvdGK1fE7aXCXKEjJZ2kYY
	v2QVkSAea+vHocn+HzgXlGZAFJECiB5skcJZqvbaet0kZ3dYto34s4e0t+JSfVuG4n5r
	Vrjl7BXT0GByLNOQoVuYh7q8UCgdnnXcaSckEcG5L1zKsLuBmvg4XQllKQGtmu+1eTUh
	gVwA==
X-Gm-Message-State: APjAAAVI34jHOmlnEzjfmcjpoOKhJEQmSU4YmuDib7ekHzZY/4ZJcVws
	w/Q1/VM0DPnaUF4djpvqFJJeFvYr1vjhKHews7QXT7yMK87hPQKyoZ9ipVcZqjqDfucMsQl6SSg
	9wYngroBtMjh3TqjZi9oAHCIRBn4Gq5k59cOfG4A56A==
X-Received: by 2002:ac8:6b8b:: with SMTP id z11mr25874581qts.294.1568194616186;
	Wed, 11 Sep 2019 02:36:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyduGh4tE6L2L4j9QajV/pYOcnJTIR4z+KJdEnrqU8VS2MoRsYfqeB30DhBJEta8i78v0T5Nw==
X-Received: by 2002:ac8:6b8b:: with SMTP id z11mr25874563qts.294.1568194616000;
	Wed, 11 Sep 2019 02:36:56 -0700 (PDT)
Received: from redhat.com ([80.74.107.118]) by smtp.gmail.com with ESMTPSA id
	j7sm13058768qtc.73.2019.09.11.02.36.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 02:36:55 -0700 (PDT)
Date: Wed, 11 Sep 2019 05:36:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC PATCH 3/4] virtio: introudce a mdev based transport
Message-ID: <20190911053502-mutt-send-email-mst@kernel.org>
References: <20190910081935.30516-1-jasowang@redhat.com>
	<20190910081935.30516-4-jasowang@redhat.com>
	<20190910055744-mutt-send-email-mst@kernel.org>
	<572ffc34-3081-8503-d3cc-192edc9b5311@redhat.com>
	<20190910094807-mutt-send-email-mst@kernel.org>
	<390647ae-0a53-5f2b-ccb0-28ed657636e6@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <390647ae-0a53-5f2b-ccb0-28ed657636e6@redhat.com>
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	RCVD_IN_SORBS_WEB autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, cohuck@redhat.com,
	linux-kernel@vger.kernel.org, kwankhede@nvidia.com,
	xiao.w.wang@intel.com, zhihong.wang@intel.com, maxime.coquelin@redhat.com,
	virtualization@lists.linux-foundation.org,
	haotian.wang@sifive.com, idos@mellanox.com, rob.miller@broadcom.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMTA6Mzg6MzlBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzkvMTAg5LiL5Y2IOTo1MiwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMDk6MTM6MDJQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gT24gMjAxOS85LzEwIOS4i+WNiDY6MDEsIE1pY2hhZWwgUy4gVHNpcmtp
biB3cm90ZToKPiA+ID4gPiA+ICsjaWZuZGVmIF9MSU5VWF9WSVJUSU9fTURFVl9ICj4gPiA+ID4g
PiArI2RlZmluZSBfTElOVVhfVklSVElPX01ERVZfSAo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyNp
bmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KPiA+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvdnJp
bmdoLmg+Cj4gPiA+ID4gPiArI2luY2x1ZGUgPHVhcGkvbGludXgvdmlydGlvX25ldC5oPgo+ID4g
PiA+ID4gKwo+ID4gPiA+ID4gKy8qCj4gPiA+ID4gPiArICogSW9jdGxzCj4gPiA+ID4gPiArICov
Cj4gPiA+ID4gUGxzIGFkZCBhIGJpdCBtb3JlIGNvbnRlbnQgaGVyZS4gSXQncyByZWR1bmRhbnQg
dG8gc3RhdGUgdGhlc2UKPiA+ID4gPiBhcmUgaW9jdGxzLiBNdWNoIGJldHRlciB0byBkb2N1bWVu
dCB3aGF0IGRvZXMgZWFjaCBvbmUgZG8uCj4gPiA+IAo+ID4gPiBPay4KPiA+ID4gCj4gPiA+IAo+
ID4gPiA+ID4gKwo+ID4gPiA+ID4gK3N0cnVjdCB2aXJ0aW9fbWRldl9jYWxsYmFjayB7Cj4gPiA+
ID4gPiArCWlycXJldHVybl90ICgqY2FsbGJhY2spKHZvaWQgKik7Cj4gPiA+ID4gPiArCXZvaWQg
KnByaXZhdGU7Cj4gPiA+ID4gPiArfTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsjZGVmaW5lIFZJ
UlRJT19NREVWIDB4QUYKPiA+ID4gPiA+ICsjZGVmaW5lIFZJUlRJT19NREVWX1NFVF9WUV9DQUxM
QkFDSyBfSU9XKFZJUlRJT19NREVWLCAweDAwLCBcCj4gPiA+ID4gPiArCQkJCQkgc3RydWN0IHZp
cnRpb19tZGV2X2NhbGxiYWNrKQo+ID4gPiA+ID4gKyNkZWZpbmUgVklSVElPX01ERVZfU0VUX0NP
TkZJR19DQUxMQkFDSyBfSU9XKFZJUlRJT19NREVWLCAweDAxLCBcCj4gPiA+ID4gPiArCQkJCQlz
dHJ1Y3QgdmlydGlvX21kZXZfY2FsbGJhY2spCj4gPiA+ID4gRnVuY3Rpb24gcG9pbnRlciBpbiBh
biBpb2N0bCBwYXJhbWV0ZXI/IEhvdyBkb2VzIHRoaXMgZXZlciBtYWtlIHNlbnNlPwo+ID4gPiAK
PiA+ID4gSSBhZG1pdCB0aGlzIGlzIGhhY2t5IChjYXN0aW5nKS4KPiA+ID4gCj4gPiA+IAo+ID4g
PiA+IEFuZCBjYW4ndCB3ZSB1c2UgYSBjb3VwbGUgb2YgcmVnaXN0ZXJzIGZvciB0aGlzLCBhbmQg
YXZvaWQgaW9jdGxzPwo+ID4gPiAKPiA+ID4gWWVzLCBob3cgYWJvdXQgc29tZXRoaW5nIGxpa2Ug
aW50ZXJydXB0IG51bWJlcnMgZm9yIGVhY2ggdmlydHF1ZXVlIGFuZAo+ID4gPiBjb25maWc/Cj4g
PiBTaG91bGQgd2UganVzdCByZXVzZSBWSVJUSU9fUENJX0NPTU1PTl9RX1hYWCB0aGVuPwo+IAo+
IAo+IFlvdSBtZWFuIHNvbWV0aGluZyBsaWtlIFZJUlRJT19QQ0lfQ09NTU9OX1FfTVNJWD8gVGhl
biBpdCBiZWNvbWVzIGEgUENJCj4gdHJhbnNwb3J0IGluIGZhY3QuIEFuZCB1c2luZyBlaXRoZXIg
TVNJWCBvciBpcnEgbnVtYmVyIGlzIGFjdHVhbGx5IGFub3RoZXIKPiBsYXllciBvZiBpbmRpcmVj
dGlvbi4gU28gSSB0aGluayB3ZSBjYW4ganVzdCB3cml0ZSBjYWxsYmFjayBmdW5jdGlvbiBhbmQK
PiBwYXJhbWV0ZXIgdGhyb3VnaCByZWdpc3RlcnMuCgpJIGp1c3QgcmVhbGl6ZWQsIGFsbCB0aGVz
ZSByZWdpc3RlcnMgYXJlIGp1c3QgZW5jb2RlZCBzbyB5b3UKY2FuIHBhc3Mgc3R1ZmYgdGhyb3Vn
aCByZWFkL3dyaXRlLiBCdXQgaXQgY2FuIGluc3RlYWQgYmUKanVzdCBhIG5vcm1hbCBDIGZ1bmN0
aW9uIGNhbGwgd2l0aCBubyBtZXNzeSBlbmNvZGluZy4KU28gd2h5IGRvIHdlIHdhbnQgdG8gZG8g
dGhpcyBlbmNvZGluZz8KCgo+IAo+ID4gCj4gPiAKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsjZGVm
aW5lIFZJUlRJT19NREVWX0RFVklDRV9BUElfU1RSSU5HCQkidmlydGlvLW1kZXYiCj4gPiA+ID4g
PiArCj4gPiA+ID4gPiArLyoKPiA+ID4gPiA+ICsgKiBDb250cm9sIHJlZ2lzdGVycwo+ID4gPiA+
ID4gKyAqLwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKy8qIE1hZ2ljIHZhbHVlICgidmlydCIgc3Ry
aW5nKSAtIFJlYWQgT25seSAqLwo+ID4gPiA+ID4gKyNkZWZpbmUgVklSVElPX01ERVZfTUFHSUNf
VkFMVUUJCTB4MDAwCj4gPiA+ID4gPiArCj4gPiA+ID4gPiArLyogVmlydGlvIGRldmljZSB2ZXJz
aW9uIC0gUmVhZCBPbmx5ICovCj4gPiA+ID4gPiArI2RlZmluZSBWSVJUSU9fTURFVl9WRVJTSU9O
CQkweDAwNAo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKy8qIFZpcnRpbyBkZXZpY2UgSUQgLSBSZWFk
IE9ubHkgKi8KPiA+ID4gPiA+ICsjZGVmaW5lIFZJUlRJT19NREVWX0RFVklDRV9JRAkJMHgwMDgK
PiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsvKiBWaXJ0aW8gdmVuZG9yIElEIC0gUmVhZCBPbmx5ICov
Cj4gPiA+ID4gPiArI2RlZmluZSBWSVJUSU9fTURFVl9WRU5ET1JfSUQJCTB4MDBjCj4gPiA+ID4g
PiArCj4gPiA+ID4gPiArLyogQml0bWFzayBvZiB0aGUgZmVhdHVyZXMgc3VwcG9ydGVkIGJ5IHRo
ZSBkZXZpY2UgKGhvc3QpCj4gPiA+ID4gPiArICogKDMyIGJpdHMgcGVyIHNldCkgLSBSZWFkIE9u
bHkgKi8KPiA+ID4gPiA+ICsjZGVmaW5lIFZJUlRJT19NREVWX0RFVklDRV9GRUFUVVJFUwkweDAx
MAo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKy8qIERldmljZSAoaG9zdCkgZmVhdHVyZXMgc2V0IHNl
bGVjdG9yIC0gV3JpdGUgT25seSAqLwo+ID4gPiA+ID4gKyNkZWZpbmUgVklSVElPX01ERVZfREVW
SUNFX0ZFQVRVUkVTX1NFTAkweDAxNAo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKy8qIEJpdG1hc2sg
b2YgZmVhdHVyZXMgYWN0aXZhdGVkIGJ5IHRoZSBkcml2ZXIgKGd1ZXN0KQo+ID4gPiA+ID4gKyAq
ICgzMiBiaXRzIHBlciBzZXQpIC0gV3JpdGUgT25seSAqLwo+ID4gPiA+ID4gKyNkZWZpbmUgVklS
VElPX01ERVZfRFJJVkVSX0ZFQVRVUkVTCTB4MDIwCj4gPiA+ID4gPiArCj4gPiA+ID4gPiArLyog
QWN0aXZhdGVkIGZlYXR1cmVzIHNldCBzZWxlY3RvciAtIFdyaXRlIE9ubHkgKi8KPiA+ID4gPiA+
ICsjZGVmaW5lIFZJUlRJT19NREVWX0RSSVZFUl9GRUFUVVJFU19TRUwJMHgwMjQKPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ICsvKiBRdWV1ZSBzZWxlY3RvciAtIFdyaXRlIE9ubHkgKi8KPiA+ID4gPiA+
ICsjZGVmaW5lIFZJUlRJT19NREVWX1FVRVVFX1NFTAkJMHgwMzAKPiA+ID4gPiA+ICsKPiA+ID4g
PiA+ICsvKiBNYXhpbXVtIHNpemUgb2YgdGhlIGN1cnJlbnRseSBzZWxlY3RlZCBxdWV1ZSAtIFJl
YWQgT25seSAqLwo+ID4gPiA+ID4gKyNkZWZpbmUgVklSVElPX01ERVZfUVVFVUVfTlVNX01BWAkw
eDAzNAo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKy8qIFF1ZXVlIHNpemUgZm9yIHRoZSBjdXJyZW50
bHkgc2VsZWN0ZWQgcXVldWUgLSBXcml0ZSBPbmx5ICovCj4gPiA+ID4gPiArI2RlZmluZSBWSVJU
SU9fTURFVl9RVUVVRV9OVU0JCTB4MDM4Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArLyogUmVhZHkg
Yml0IGZvciB0aGUgY3VycmVudGx5IHNlbGVjdGVkIHF1ZXVlIC0gUmVhZCBXcml0ZSAqLwo+ID4g
PiA+ID4gKyNkZWZpbmUgVklSVElPX01ERVZfUVVFVUVfUkVBRFkJCTB4MDQ0Cj4gPiA+ID4gSXMg
dGhpcyBzYW1lIGFzIHN0YXJ0ZWQ/Cj4gPiA+IAo+ID4gPiBEbyB5b3UgbWVhbiAic3RhdHVzIj8K
PiA+IEkgcmVhbGx5IG1lYW50ICJlbmFibGVkIiwgZGlkbid0IHJlbWVtYmVyIHRoZSBjb3JyZWN0
IG5hbWUuCj4gPiBBcyBpbjogIFZJUlRJT19QQ0lfQ09NTU9OX1FfRU5BQkxFCj4gCj4gCj4gWWVz
LCBpdCdzIHRoZSBzYW1lLgo+IAo+IFRoYW5rcwo+IAo+IAo+ID4gCj4gPiA+ID4gPiArCj4gPiA+
ID4gPiArLyogQWxpZ25tZW50IG9mIHZpcnRxdWV1ZSAtIFJlYWQgT25seSAqLwo+ID4gPiA+ID4g
KyNkZWZpbmUgVklSVElPX01ERVZfUVVFVUVfQUxJR04JCTB4MDQ4Cj4gPiA+ID4gPiArCj4gPiA+
ID4gPiArLyogUXVldWUgbm90aWZpZXIgLSBXcml0ZSBPbmx5ICovCj4gPiA+ID4gPiArI2RlZmlu
ZSBWSVJUSU9fTURFVl9RVUVVRV9OT1RJRlkJMHgwNTAKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsv
KiBEZXZpY2Ugc3RhdHVzIHJlZ2lzdGVyIC0gUmVhZCBXcml0ZSAqLwo+ID4gPiA+ID4gKyNkZWZp
bmUgVklSVElPX01ERVZfU1RBVFVTCQkweDA2MAo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKy8qIFNl
bGVjdGVkIHF1ZXVlJ3MgRGVzY3JpcHRvciBUYWJsZSBhZGRyZXNzLCA2NCBiaXRzIGluIHR3byBo
YWx2ZXMgKi8KPiA+ID4gPiA+ICsjZGVmaW5lIFZJUlRJT19NREVWX1FVRVVFX0RFU0NfTE9XCTB4
MDgwCj4gPiA+ID4gPiArI2RlZmluZSBWSVJUSU9fTURFVl9RVUVVRV9ERVNDX0hJR0gJMHgwODQK
PiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsvKiBTZWxlY3RlZCBxdWV1ZSdzIEF2YWlsYWJsZSBSaW5n
IGFkZHJlc3MsIDY0IGJpdHMgaW4gdHdvIGhhbHZlcyAqLwo+ID4gPiA+ID4gKyNkZWZpbmUgVklS
VElPX01ERVZfUVVFVUVfQVZBSUxfTE9XCTB4MDkwCj4gPiA+ID4gPiArI2RlZmluZSBWSVJUSU9f
TURFVl9RVUVVRV9BVkFJTF9ISUdICTB4MDk0Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArLyogU2Vs
ZWN0ZWQgcXVldWUncyBVc2VkIFJpbmcgYWRkcmVzcywgNjQgYml0cyBpbiB0d28gaGFsdmVzICov
Cj4gPiA+ID4gPiArI2RlZmluZSBWSVJUSU9fTURFVl9RVUVVRV9VU0VEX0xPVwkweDBhMAo+ID4g
PiA+ID4gKyNkZWZpbmUgVklSVElPX01ERVZfUVVFVUVfVVNFRF9ISUdICTB4MGE0Cj4gPiA+ID4g
PiArCj4gPiA+ID4gPiArLyogQ29uZmlndXJhdGlvbiBhdG9taWNpdHkgdmFsdWUgKi8KPiA+ID4g
PiA+ICsjZGVmaW5lIFZJUlRJT19NREVWX0NPTkZJR19HRU5FUkFUSU9OCTB4MGZjCj4gPiA+ID4g
PiArCj4gPiA+ID4gPiArLyogVGhlIGNvbmZpZyBzcGFjZSBpcyBkZWZpbmVkIGJ5IGVhY2ggZHJp
dmVyIGFzCj4gPiA+ID4gPiArICogdGhlIHBlci1kcml2ZXIgY29uZmlndXJhdGlvbiBzcGFjZSAt
IFJlYWQgV3JpdGUgKi8KPiA+ID4gPiA+ICsjZGVmaW5lIFZJUlRJT19NREVWX0NPTkZJRwkJMHgx
MDAKPiA+ID4gPiBNaXhpbmcgZGV2aWNlIGFuZCBnZW5lcmljIGNvbmZpZyBzcGFjZSBpcyB3aGF0
IHZpcnRpbyBwY2kgZGlkLAo+ID4gPiA+IGNhdXNlZCBsb3RzIG9mIHByb2JsZW1zIHdpdGggZXh0
ZW5zaW9ucy4KPiA+ID4gPiBJdCB3b3VsZCBiZSBiZXR0ZXIgdG8gcmVzZXJ2ZSBtdWNoIG1vcmUg
c3BhY2UuCj4gPiA+IAo+ID4gPiBJIHNlZSwgd2lsbCBkbyB0aGlzLgo+ID4gPiAKPiA+ID4gVGhh
bmtzCj4gPiA+IAo+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsjZW5kaWYK
PiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsvKiBSZWFkeSBiaXQgZm9yIHRoZSBj
dXJyZW50bHkgc2VsZWN0ZWQgcXVldWUgLSBSZWFkIFdyaXRlICovCj4gPiA+ID4gPiAtLSAKPiA+
ID4gPiA+IDIuMTkuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
