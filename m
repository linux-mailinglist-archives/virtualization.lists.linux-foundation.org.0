Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DF61B1672
	for <lists.virtualization@lfdr.de>; Mon, 20 Apr 2020 22:00:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3344187770;
	Mon, 20 Apr 2020 20:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zvpJPJzBYvgz; Mon, 20 Apr 2020 20:00:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D50EC876D7;
	Mon, 20 Apr 2020 20:00:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9A13C0177;
	Mon, 20 Apr 2020 20:00:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2501C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 20:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9964021FF8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 20:00:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XhmIfdeO1Omn
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 20:00:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 5F24521FAC
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 20:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587412809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+20lqtsdLoetbi1VKrLQV/f/K/xwxYS/9ftQPVBgJ9o=;
 b=frFIeFvB88aMDcJ6igS/aDBKi3T1xldX3PIzPhYcljPwdZlnLG7mC/DfVFy4pRtHsXNkqh
 oT4AlUgq+BVSudR4M+OUyS7cBGglqO+mzXMFlOl3kwa1ZSGjfYDQnGPSwsoV7Zx8CzNx1R
 nPSK9MeDxRJ9QWn7vTP01Scvgb0NE2g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-svKhYCVKO42w-JQTyOH7aQ-1; Mon, 20 Apr 2020 16:00:06 -0400
X-MC-Unique: svKhYCVKO42w-JQTyOH7aQ-1
Received: by mail-wm1-f70.google.com with SMTP id o26so366337wmh.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 13:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=+20lqtsdLoetbi1VKrLQV/f/K/xwxYS/9ftQPVBgJ9o=;
 b=F00KCHTtNZpKiuoFI10bo3P/z9tZkk++9t85FQIv3Ys20rLmDtF/Xo2PXo1gigl5GP
 GQRsK8NCZtlY91Go28ZTyVuNzDVf6K2qh7p5foq4x1D5mA8K844sdwtIdxfGtaIxz/tn
 VumC/40YqeO2GgCZZQEc20LT9N2prF1Vl0jWOddDTD2PtWVgBDbDrBj3TsRWKP27bj3/
 6jWcsaaW94dMK2u9ZCvTrjLdhRS5WSIEBg4DfUFf54q+YiYNVrwS90P9zpdJfMmPQZFl
 CD1UzOh4O5x/XbsQlmBAJ1G62RsSgpzkW7/rlzJ+ju+sOVdsthovxdM0eBTIDw+DMUKp
 QXnA==
X-Gm-Message-State: AGi0PubAGvA0x4gPVu9kz4WaFnwgukqXwq/kvpHo+JeBE04SEKbfcjK+
 hcMXwLMMm3Aa63JulIqGWPPU63swzi3lGexo7bD1sxTlUbdPt9xvV+uCKulP++h2we4x5e61LEi
 uDJpFeiUo+Baa5BxySqt7GtixuhORaMZ0GzhOjh7odQ==
X-Received: by 2002:adf:f881:: with SMTP id u1mr20010577wrp.348.1587412804913; 
 Mon, 20 Apr 2020 13:00:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypJIVhqetK7aUCHYEkuU804XOceo66/cE0Dx1Q5aW14bSOsutRUOmxAsjw6JtGgBkBYwz6DrLg==
X-Received: by 2002:adf:f881:: with SMTP id u1mr20010546wrp.348.1587412804645; 
 Mon, 20 Apr 2020 13:00:04 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id m1sm677467wro.64.2020.04.20.13.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 13:00:03 -0700 (PDT)
Date: Mon, 20 Apr 2020 16:00:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL v2] vhost: cleanups and fixes
Message-ID: <20200420160001-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: hulkci@huawei.com, kvm@vger.kernel.org, arnd@arndb.de,
 gustavo@embeddedor.com, netdev@vger.kernel.org, mst@redhat.com,
 yuehaibing@huawei.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 yanaijie@huawei.com, eli@mellanox.com, sfr@canb.auug.org.au,
 alexander.h.duyck@linux.intel.com, bjorn.andersson@linaro.org
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA4ZjNkOWYzNTQyODY3NDVjNzUxMzc0
ZjVmMWZjYWZlZTZiM2YzMTM2OgoKICBMaW51eCA1LjctcmMxICgyMDIwLTA0LTEyIDEyOjM1OjU1
IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L21zdC92aG9zdC5naXQg
dGFncy9mb3JfbGludXMKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBkMDg1ZWI4Y2U3
MjdlNTgxYWJmODE0NTI0NGVhYTMzMzkwMjFiZTJmOgoKICB2aG9zdDogZGlzYWJsZSBmb3IgT0FC
SSAoMjAyMC0wNC0yMCAxMDoxOToyMiAtMDQwMCkKCkNoYW5nZXMgZnJvbSB2MToKCURyb3BwZWQg
YSBidW5jaCBvZiBjbGVhbnVwcyB3aGljaCB0dXJuZWQgb3V0IHRvIGJlIGNvbnRyb3ZlcnNpYWwK
ClRoaXMgaGFzIGJlZW4gaW4gbmV4dCBmb3IgYSB3aGlsZSwgdGhvdWdoIEkgdHdlYWtlZCBzb21l
IGNvbW1pdApsb2dzIHNvIHRoZSBoYXNoZXMgZGlmZmVyLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQp2aXJ0aW86IGZpeGVz
LCBjbGVhbnVwcwoKU29tZSBidWcgZml4ZXMuCkNsZWFudXAgYSBjb3VwbGUgb2YgaXNzdWVzIHRo
YXQgc3VyZmFjZWQgbWVhbndoaWxlLgpEaXNhYmxlIHZob3N0IG9uIEFSTSB3aXRoIE9BQkkgZm9y
IG5vdyAtIHRvIGJlIGZpeGVkCmZ1bGx5IGxhdGVyIGluIHRoZSBjeWNsZSBvciBpbiB0aGUgbmV4
dCByZWxlYXNlLgoKU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0
LmNvbT4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KQWxleGFuZGVyIER1eWNrICgxKToKICAgICAgdmlydGlvLWJhbGxvb246
IEF2b2lkIHVzaW5nIHRoZSB3b3JkICdyZXBvcnQnIHdoZW4gcmVmZXJyaW5nIHRvIGZyZWUgcGFn
ZSBoaW50aW5nCgpFdWdlbmlvIFDDqXJleiAoMSk6CiAgICAgIHZob3N0OiBDcmVhdGUgYWNjZXNz
b3JzIGZvciB2aXJ0cXVldWVzIHByaXZhdGVfZGF0YQoKR3VzdGF2byBBLiBSLiBTaWx2YSAoMSk6
CiAgICAgIHZob3N0OiB2ZHBhOiByZW1vdmUgdW5uZWNlc3NhcnkgbnVsbCBjaGVjawoKSmFzb24g
V2FuZyAoMSk6CiAgICAgIHZkcGE6IGZpeCBjb21tZW50IG9mIHZkcGFfcmVnaXN0ZXJfZGV2aWNl
KCkKCkphc29uIFlhbiAoMik6CiAgICAgIHZob3N0OiByZW1vdmUgc2V0IGJ1dCBub3QgdXNlZCB2
YXJpYWJsZSAnc3RhdHVzJwogICAgICB2aXJ0aW8tYmFsbG9vbjogbWFrZSB2aXJ0YmFsbG9vbl9m
cmVlX3BhZ2VfcmVwb3J0KCkgc3RhdGljCgpNaWNoYWVsIFMuIFRzaXJraW4gKDE1KToKICAgICAg
dmRwYS1zaW06IGRlcGVuZCBvbiBIQVNfRE1BCiAgICAgIHZpcnRpby90ZXN0OiBmaXggdXAgYWZ0
ZXIgSU9UTEIgY2hhbmdlcwogICAgICB0b29scy92aXJ0aW86IGRlZmluZSBhbGlnbmVkIGF0dHJp
YnV0ZQogICAgICB0b29scy92aXJ0aW86IG1ha2UgYXNtL2JhcnJpZXIuaCBzZWxmIGNvbnRhaW5l
ZAogICAgICB2aXJ0Z3B1OiBwdWxsIGluIHVhY2Nlc3MuaAogICAgICB2aXJ0aW8tcm5nOiBwdWxs
IGluIHNsYWIuaAogICAgICByZW1vdGVwcm9jOiBwdWxsIGluIHNsYWIuaAogICAgICB2aXJ0aW9f
aW5wdXQ6IHB1bGwgaW4gc2xhYi5oCiAgICAgIHJwbXNnOiBwdWxsIGluIHNsYWIuaAogICAgICBy
ZW1vdGVwcm9jOiBwdWxsIGluIHNsYWIuaAogICAgICB2ZHBhOiBhbGxvdyBhIDMyIGJpdCB2cSBh
bGlnbm1lbnQKICAgICAgdmRwYTogbWFrZSB2aG9zdCwgdmlydGlvIGRlcGVuZCBvbiBtZW51CiAg
ICAgIHZpcnRpb19ibGs6IGFkZCBhIG1pc3NpbmcgaW5jbHVkZQogICAgICB2aXJ0aW86IGRyb3Ag
dnJpbmdoLmggZGVwZW5kZW5jeQogICAgICB2aG9zdDogZGlzYWJsZSBmb3IgT0FCSQoKU3RlcGhl
biBSb3Rod2VsbCAoMSk6CiAgICAgIGRybS92aXJ0aW86IGZpeCB1cCBmb3IgaW5jbHVkZSBmaWxl
IGNoYW5nZXMKCll1ZUhhaWJpbmcgKDIpOgogICAgICB2ZHBhOiByZW1vdmUgdW51c2VkIHZhcmlh
YmxlcyAnaWZjdmYnIGFuZCAnaWZjdmZfbG0nCiAgICAgIHZkcGFzaW06IFJldHVybiBzdGF0dXMg
aW4gdmRwYXNpbV9nZXRfc3RhdHVzCgogZHJpdmVycy9ibG9jay92aXJ0aW9fYmxrLmMgICAgICAg
ICAgICAgfCAgMSArCiBkcml2ZXJzL2NoYXIvaHdfcmFuZG9tL3ZpcnRpby1ybmcuYyAgICB8ICAx
ICsKIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jIHwgIDEgKwogZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ttcy5jICAgfCAgMSArCiBkcml2ZXJzL21pc2MvbWlj
L0tjb25maWcgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL25ldC9jYWlmL0tjb25maWcg
ICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL3JlbW90ZXByb2MvcmVtb3RlcHJvY19zeXNm
cy5jICB8ICAxICsKIGRyaXZlcnMvcmVtb3RlcHJvYy9zdG0zMl9ycHJvYy5jICAgICAgIHwgIDEg
KwogZHJpdmVycy9ycG1zZy9tdGtfcnBtc2cuYyAgICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJz
L3ZkcGEvS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8IDE4ICsrKysrKy0tLS0tLS0tLS0tLQog
ZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuYyAgICAgICAgfCAgMiAtLQogZHJpdmVycy92
ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYyAgICAgICAgfCAgNCArLS0tCiBkcml2ZXJzL3ZkcGEvdmRw
YS5jICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRw
YV9zaW0uYyAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvdmhvc3QvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgIHwgMjEgKysrKysrKysrKysrKysrKy0tLS0tCiBkcml2ZXJzL3Zob3N0L25ldC5jICAg
ICAgICAgICAgICAgICAgICB8IDI4ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIGRyaXZl
cnMvdmhvc3Qvc2NzaS5jICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKysrKy0tLS0tLS0KIGRy
aXZlcnMvdmhvc3QvdGVzdC5jICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKysrKy0tLS0tLS0K
IGRyaXZlcnMvdmhvc3QvdmRwYS5jICAgICAgICAgICAgICAgICAgIHwgIDUgLS0tLS0KIGRyaXZl
cnMvdmhvc3Qvdmhvc3QuaCAgICAgICAgICAgICAgICAgIHwgMjcgKysrKysrKysrKysrKysrKysr
KysrKysrKysrCiBkcml2ZXJzL3Zob3N0L3ZyaW5naC5jICAgICAgICAgICAgICAgICB8ICA1ICsr
KysrCiBkcml2ZXJzL3Zob3N0L3Zzb2NrLmMgICAgICAgICAgICAgICAgICB8IDE0ICsrKysrKyst
LS0tLS0tCiBkcml2ZXJzL3ZpcnRpby9LY29uZmlnICAgICAgICAgICAgICAgICB8ICAyICstCiBk
cml2ZXJzL3ZpcnRpby92aXJ0aW9fYmFsbG9vbi5jICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMv
dmlydGlvL3ZpcnRpb19pbnB1dC5jICAgICAgICAgIHwgIDEgKwogaW5jbHVkZS9saW51eC92ZHBh
LmggICAgICAgICAgICAgICAgICAgfCAgMiArLQogaW5jbHVkZS9saW51eC92aXJ0aW8uaCAgICAg
ICAgICAgICAgICAgfCAgMSAtCiBpbmNsdWRlL2xpbnV4L3ZyaW5naC5oICAgICAgICAgICAgICAg
ICB8ICA2ICsrKysrKwogaW5jbHVkZS91YXBpL2xpbnV4L3ZpcnRpb19iYWxsb29uLmggICAgfCAx
MSArKysrKysrKystLQogdG9vbHMvdmlydGlvL01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAg
NSArKystLQogdG9vbHMvdmlydGlvL2FzbS9iYXJyaWVyLmggICAgICAgICAgICAgfCAgMSArCiB0
b29scy92aXJ0aW8vZ2VuZXJhdGVkL2F1dG9jb25mLmggICAgICB8ICAwCiB0b29scy92aXJ0aW8v
bGludXgvY29tcGlsZXIuaCAgICAgICAgICB8ICAxICsKIDMzIGZpbGVzIGNoYW5nZWQsIDEyOCBp
bnNlcnRpb25zKCspLCA3NSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy92
aXJ0aW8vZ2VuZXJhdGVkL2F1dG9jb25mLmgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
