Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE71AEC59
	for <lists.virtualization@lfdr.de>; Tue, 10 Sep 2019 15:53:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 20569DA5;
	Tue, 10 Sep 2019 13:52:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 02127D91
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 13:52:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 70A338A2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 13:52:56 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E4CEBC05AA58
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 13:52:55 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id k22so16951324qtm.7
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 06:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=vKjBadJZsVZtUGd3WVckVL2DIAFF4FA1DCNgRycmkBI=;
	b=fz/GBdtxKayKrmbaCdtddHiEQg1n5QMJXNQ9FotkNuFRpL6IasipF7yn9S12jC3qTI
	Jizn2iG3eYLR3OsyaWYEsGfdPNT73BYCDeSqIFntewaHdXqM6UTlOqFc+TDc/D2IUclE
	s8JfuJSCN22w9KFqxo3AEX36XbraPqquk1QJm2/Xgx1fmCttYHBgL1Hn6STS8jXrDjnl
	ykR6/KQFG51hheRPv3Qlku7kXXXJdY0QtaHN6glW2vdHc13W8nolTbkQ9MzQjDlL0kHD
	5lBom7cnI2l/cHO6gYh6gQg0qvnB6IV2SUADxdLlmsEn4zBPW2C9vnJP3+dSlMzQUE4z
	CchA==
X-Gm-Message-State: APjAAAWwRhdlpeDd/Gt7Uks7wFYRfdnpqp6fm8NdYdlmjSYUZFOcwZUs
	sACoHB7q1UZfdClkTpuSXoAgSulVMroe4jY4/DxBbMEDpOo33TZWXj6KHN98eC0R/3vtSyCDx8c
	M87uBhxpUpbGllyDX7PH0bAWKwE8nXlfK//IiY1CSLw==
X-Received: by 2002:a0c:e811:: with SMTP id y17mr7641976qvn.68.1568123575196; 
	Tue, 10 Sep 2019 06:52:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy87Xk8h9CwEg4tdqy4DXt/JFYQLpQHouOJ6fOEiaMkub6yelg6yVSS11xTwQ5fJFutl2Pk0A==
X-Received: by 2002:a0c:e811:: with SMTP id y17mr7641951qvn.68.1568123574950; 
	Tue, 10 Sep 2019 06:52:54 -0700 (PDT)
Received: from redhat.com ([80.74.107.118]) by smtp.gmail.com with ESMTPSA id
	n42sm10807604qta.31.2019.09.10.06.52.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Sep 2019 06:52:53 -0700 (PDT)
Date: Tue, 10 Sep 2019 09:52:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC PATCH 3/4] virtio: introudce a mdev based transport
Message-ID: <20190910094807-mutt-send-email-mst@kernel.org>
References: <20190910081935.30516-1-jasowang@redhat.com>
	<20190910081935.30516-4-jasowang@redhat.com>
	<20190910055744-mutt-send-email-mst@kernel.org>
	<572ffc34-3081-8503-d3cc-192edc9b5311@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <572ffc34-3081-8503-d3cc-192edc9b5311@redhat.com>
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

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMDk6MTM6MDJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzkvMTAg5LiL5Y2INjowMSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gPiArI2lmbmRlZiBfTElOVVhfVklSVElPX01ERVZfSAo+ID4gPiArI2RlZmluZSBfTElO
VVhfVklSVElPX01ERVZfSAo+ID4gPiArCj4gPiA+ICsjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0
Lmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvdnJpbmdoLmg+Cj4gPiA+ICsjaW5jbHVkZSA8dWFw
aS9saW51eC92aXJ0aW9fbmV0Lmg+Cj4gPiA+ICsKPiA+ID4gKy8qCj4gPiA+ICsgKiBJb2N0bHMK
PiA+ID4gKyAqLwo+ID4gUGxzIGFkZCBhIGJpdCBtb3JlIGNvbnRlbnQgaGVyZS4gSXQncyByZWR1
bmRhbnQgdG8gc3RhdGUgdGhlc2UKPiA+IGFyZSBpb2N0bHMuIE11Y2ggYmV0dGVyIHRvIGRvY3Vt
ZW50IHdoYXQgZG9lcyBlYWNoIG9uZSBkby4KPiAKPiAKPiBPay4KPiAKPiAKPiA+IAo+ID4gPiAr
Cj4gPiA+ICtzdHJ1Y3QgdmlydGlvX21kZXZfY2FsbGJhY2sgewo+ID4gPiArCWlycXJldHVybl90
ICgqY2FsbGJhY2spKHZvaWQgKik7Cj4gPiA+ICsJdm9pZCAqcHJpdmF0ZTsKPiA+ID4gK307Cj4g
PiA+ICsKPiA+ID4gKyNkZWZpbmUgVklSVElPX01ERVYgMHhBRgo+ID4gPiArI2RlZmluZSBWSVJU
SU9fTURFVl9TRVRfVlFfQ0FMTEJBQ0sgX0lPVyhWSVJUSU9fTURFViwgMHgwMCwgXAo+ID4gPiAr
CQkJCQkgc3RydWN0IHZpcnRpb19tZGV2X2NhbGxiYWNrKQo+ID4gPiArI2RlZmluZSBWSVJUSU9f
TURFVl9TRVRfQ09ORklHX0NBTExCQUNLIF9JT1coVklSVElPX01ERVYsIDB4MDEsIFwKPiA+ID4g
KwkJCQkJc3RydWN0IHZpcnRpb19tZGV2X2NhbGxiYWNrKQo+ID4gRnVuY3Rpb24gcG9pbnRlciBp
biBhbiBpb2N0bCBwYXJhbWV0ZXI/IEhvdyBkb2VzIHRoaXMgZXZlciBtYWtlIHNlbnNlPwo+IAo+
IAo+IEkgYWRtaXQgdGhpcyBpcyBoYWNreSAoY2FzdGluZykuCj4gCj4gCj4gPiBBbmQgY2FuJ3Qg
d2UgdXNlIGEgY291cGxlIG9mIHJlZ2lzdGVycyBmb3IgdGhpcywgYW5kIGF2b2lkIGlvY3Rscz8K
PiAKPiAKPiBZZXMsIGhvdyBhYm91dCBzb21ldGhpbmcgbGlrZSBpbnRlcnJ1cHQgbnVtYmVycyBm
b3IgZWFjaCB2aXJ0cXVldWUgYW5kCj4gY29uZmlnPwoKU2hvdWxkIHdlIGp1c3QgcmV1c2UgVklS
VElPX1BDSV9DT01NT05fUV9YWFggdGhlbj8KCgo+IAo+ID4gCj4gPiA+ICsKPiA+ID4gKyNkZWZp
bmUgVklSVElPX01ERVZfREVWSUNFX0FQSV9TVFJJTkcJCSJ2aXJ0aW8tbWRldiIKPiA+ID4gKwo+
ID4gPiArLyoKPiA+ID4gKyAqIENvbnRyb2wgcmVnaXN0ZXJzCj4gPiA+ICsgKi8KPiA+ID4gKwo+
ID4gPiArLyogTWFnaWMgdmFsdWUgKCJ2aXJ0IiBzdHJpbmcpIC0gUmVhZCBPbmx5ICovCj4gPiA+
ICsjZGVmaW5lIFZJUlRJT19NREVWX01BR0lDX1ZBTFVFCQkweDAwMAo+ID4gPiArCj4gPiA+ICsv
KiBWaXJ0aW8gZGV2aWNlIHZlcnNpb24gLSBSZWFkIE9ubHkgKi8KPiA+ID4gKyNkZWZpbmUgVklS
VElPX01ERVZfVkVSU0lPTgkJMHgwMDQKPiA+ID4gKwo+ID4gPiArLyogVmlydGlvIGRldmljZSBJ
RCAtIFJlYWQgT25seSAqLwo+ID4gPiArI2RlZmluZSBWSVJUSU9fTURFVl9ERVZJQ0VfSUQJCTB4
MDA4Cj4gPiA+ICsKPiA+ID4gKy8qIFZpcnRpbyB2ZW5kb3IgSUQgLSBSZWFkIE9ubHkgKi8KPiA+
ID4gKyNkZWZpbmUgVklSVElPX01ERVZfVkVORE9SX0lECQkweDAwYwo+ID4gPiArCj4gPiA+ICsv
KiBCaXRtYXNrIG9mIHRoZSBmZWF0dXJlcyBzdXBwb3J0ZWQgYnkgdGhlIGRldmljZSAoaG9zdCkK
PiA+ID4gKyAqICgzMiBiaXRzIHBlciBzZXQpIC0gUmVhZCBPbmx5ICovCj4gPiA+ICsjZGVmaW5l
IFZJUlRJT19NREVWX0RFVklDRV9GRUFUVVJFUwkweDAxMAo+ID4gPiArCj4gPiA+ICsvKiBEZXZp
Y2UgKGhvc3QpIGZlYXR1cmVzIHNldCBzZWxlY3RvciAtIFdyaXRlIE9ubHkgKi8KPiA+ID4gKyNk
ZWZpbmUgVklSVElPX01ERVZfREVWSUNFX0ZFQVRVUkVTX1NFTAkweDAxNAo+ID4gPiArCj4gPiA+
ICsvKiBCaXRtYXNrIG9mIGZlYXR1cmVzIGFjdGl2YXRlZCBieSB0aGUgZHJpdmVyIChndWVzdCkK
PiA+ID4gKyAqICgzMiBiaXRzIHBlciBzZXQpIC0gV3JpdGUgT25seSAqLwo+ID4gPiArI2RlZmlu
ZSBWSVJUSU9fTURFVl9EUklWRVJfRkVBVFVSRVMJMHgwMjAKPiA+ID4gKwo+ID4gPiArLyogQWN0
aXZhdGVkIGZlYXR1cmVzIHNldCBzZWxlY3RvciAtIFdyaXRlIE9ubHkgKi8KPiA+ID4gKyNkZWZp
bmUgVklSVElPX01ERVZfRFJJVkVSX0ZFQVRVUkVTX1NFTAkweDAyNAo+ID4gPiArCj4gPiA+ICsv
KiBRdWV1ZSBzZWxlY3RvciAtIFdyaXRlIE9ubHkgKi8KPiA+ID4gKyNkZWZpbmUgVklSVElPX01E
RVZfUVVFVUVfU0VMCQkweDAzMAo+ID4gPiArCj4gPiA+ICsvKiBNYXhpbXVtIHNpemUgb2YgdGhl
IGN1cnJlbnRseSBzZWxlY3RlZCBxdWV1ZSAtIFJlYWQgT25seSAqLwo+ID4gPiArI2RlZmluZSBW
SVJUSU9fTURFVl9RVUVVRV9OVU1fTUFYCTB4MDM0Cj4gPiA+ICsKPiA+ID4gKy8qIFF1ZXVlIHNp
emUgZm9yIHRoZSBjdXJyZW50bHkgc2VsZWN0ZWQgcXVldWUgLSBXcml0ZSBPbmx5ICovCj4gPiA+
ICsjZGVmaW5lIFZJUlRJT19NREVWX1FVRVVFX05VTQkJMHgwMzgKPiA+ID4gKwo+ID4gPiArLyog
UmVhZHkgYml0IGZvciB0aGUgY3VycmVudGx5IHNlbGVjdGVkIHF1ZXVlIC0gUmVhZCBXcml0ZSAq
Lwo+ID4gPiArI2RlZmluZSBWSVJUSU9fTURFVl9RVUVVRV9SRUFEWQkJMHgwNDQKPiA+IElzIHRo
aXMgc2FtZSBhcyBzdGFydGVkPwo+IAo+IAo+IERvIHlvdSBtZWFuICJzdGF0dXMiPwoKSSByZWFs
bHkgbWVhbnQgImVuYWJsZWQiLCBkaWRuJ3QgcmVtZW1iZXIgdGhlIGNvcnJlY3QgbmFtZS4KQXMg
aW46ICBWSVJUSU9fUENJX0NPTU1PTl9RX0VOQUJMRQoKPiAKPiA+IAo+ID4gPiArCj4gPiA+ICsv
KiBBbGlnbm1lbnQgb2YgdmlydHF1ZXVlIC0gUmVhZCBPbmx5ICovCj4gPiA+ICsjZGVmaW5lIFZJ
UlRJT19NREVWX1FVRVVFX0FMSUdOCQkweDA0OAo+ID4gPiArCj4gPiA+ICsvKiBRdWV1ZSBub3Rp
ZmllciAtIFdyaXRlIE9ubHkgKi8KPiA+ID4gKyNkZWZpbmUgVklSVElPX01ERVZfUVVFVUVfTk9U
SUZZCTB4MDUwCj4gPiA+ICsKPiA+ID4gKy8qIERldmljZSBzdGF0dXMgcmVnaXN0ZXIgLSBSZWFk
IFdyaXRlICovCj4gPiA+ICsjZGVmaW5lIFZJUlRJT19NREVWX1NUQVRVUwkJMHgwNjAKPiA+ID4g
Kwo+ID4gPiArLyogU2VsZWN0ZWQgcXVldWUncyBEZXNjcmlwdG9yIFRhYmxlIGFkZHJlc3MsIDY0
IGJpdHMgaW4gdHdvIGhhbHZlcyAqLwo+ID4gPiArI2RlZmluZSBWSVJUSU9fTURFVl9RVUVVRV9E
RVNDX0xPVwkweDA4MAo+ID4gPiArI2RlZmluZSBWSVJUSU9fTURFVl9RVUVVRV9ERVNDX0hJR0gJ
MHgwODQKPiA+ID4gKwo+ID4gPiArLyogU2VsZWN0ZWQgcXVldWUncyBBdmFpbGFibGUgUmluZyBh
ZGRyZXNzLCA2NCBiaXRzIGluIHR3byBoYWx2ZXMgKi8KPiA+ID4gKyNkZWZpbmUgVklSVElPX01E
RVZfUVVFVUVfQVZBSUxfTE9XCTB4MDkwCj4gPiA+ICsjZGVmaW5lIFZJUlRJT19NREVWX1FVRVVF
X0FWQUlMX0hJR0gJMHgwOTQKPiA+ID4gKwo+ID4gPiArLyogU2VsZWN0ZWQgcXVldWUncyBVc2Vk
IFJpbmcgYWRkcmVzcywgNjQgYml0cyBpbiB0d28gaGFsdmVzICovCj4gPiA+ICsjZGVmaW5lIFZJ
UlRJT19NREVWX1FVRVVFX1VTRURfTE9XCTB4MGEwCj4gPiA+ICsjZGVmaW5lIFZJUlRJT19NREVW
X1FVRVVFX1VTRURfSElHSAkweDBhNAo+ID4gPiArCj4gPiA+ICsvKiBDb25maWd1cmF0aW9uIGF0
b21pY2l0eSB2YWx1ZSAqLwo+ID4gPiArI2RlZmluZSBWSVJUSU9fTURFVl9DT05GSUdfR0VORVJB
VElPTgkweDBmYwo+ID4gPiArCj4gPiA+ICsvKiBUaGUgY29uZmlnIHNwYWNlIGlzIGRlZmluZWQg
YnkgZWFjaCBkcml2ZXIgYXMKPiA+ID4gKyAqIHRoZSBwZXItZHJpdmVyIGNvbmZpZ3VyYXRpb24g
c3BhY2UgLSBSZWFkIFdyaXRlICovCj4gPiA+ICsjZGVmaW5lIFZJUlRJT19NREVWX0NPTkZJRwkJ
MHgxMDAKPiA+IE1peGluZyBkZXZpY2UgYW5kIGdlbmVyaWMgY29uZmlnIHNwYWNlIGlzIHdoYXQg
dmlydGlvIHBjaSBkaWQsCj4gPiBjYXVzZWQgbG90cyBvZiBwcm9ibGVtcyB3aXRoIGV4dGVuc2lv
bnMuCj4gPiBJdCB3b3VsZCBiZSBiZXR0ZXIgdG8gcmVzZXJ2ZSBtdWNoIG1vcmUgc3BhY2UuCj4g
Cj4gCj4gSSBzZWUsIHdpbGwgZG8gdGhpcy4KPiAKPiBUaGFua3MKPiAKPiAKPiA+IAo+ID4gCj4g
PiA+ICsKPiA+ID4gKyNlbmRpZgo+ID4gPiArCj4gPiA+ICsKPiA+ID4gKy8qIFJlYWR5IGJpdCBm
b3IgdGhlIGN1cnJlbnRseSBzZWxlY3RlZCBxdWV1ZSAtIFJlYWQgV3JpdGUgKi8KPiA+ID4gLS0g
Cj4gPiA+IDIuMTkuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
