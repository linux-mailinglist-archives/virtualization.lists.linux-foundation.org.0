Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D88519C184
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 14:55:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2047E888A7;
	Thu,  2 Apr 2020 12:55:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VuQJIaFDXw+N; Thu,  2 Apr 2020 12:55:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 745C3888C3;
	Thu,  2 Apr 2020 12:55:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F1B1C1D89;
	Thu,  2 Apr 2020 12:55:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 390C8C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 12:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 28861870A4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 12:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c31B6UJ4al1u
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 12:55:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DE92D87097
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 12:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585832127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=b1Y+MoZfKqZ6pUzsjF5bfD9YIuZIACPBLdpnZnNR+yE=;
 b=UjBk9VpIrWFBuhAzMwI673lkrRCYgtn5SlDnQJp+wCglwO9suwJlozNBBrGMAv9g/9dIvH
 cEi8lyX5L85Xa/ZI8GrDXBvgy2FaDMnKkNlai1JJfx+azc09o8sP5gIWBcsJ2DwtgGVTrI
 VauQLfopXmBBgF3m43ok6K3clUoo8bM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-xakukrawNsqrtPfTRrGnwQ-1; Thu, 02 Apr 2020 08:55:26 -0400
X-MC-Unique: xakukrawNsqrtPfTRrGnwQ-1
Received: by mail-qt1-f198.google.com with SMTP id x3so3022170qtv.10
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Apr 2020 05:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=b1Y+MoZfKqZ6pUzsjF5bfD9YIuZIACPBLdpnZnNR+yE=;
 b=lRZXe+krmq8F9qeIk7E2qORP0zZlWpgJlvUCAEl1+jbPYktb6PBWmAtlRz4WRnNTAK
 xutgahTM37Huq0ggRKGlW2MnZFxC49qYIAGYp+3RpETDmhRsU0DdeBs7sPvU3umz75NV
 11+IykHevX9BVotQAB0QxhN1rD6t/gQ0rf7EoLQLTdtlhgWw9W3quULpRgIQalT08gJQ
 H7u7YBZLBno2eDJqXqrOZWyvDq5cp1LXnkljqBb/0lUEXrCscUH41bvWCm0O+viIwhWZ
 xL5NneNqwYTcYces/jack9YlHGSRuJzt9QR0F6fEI7Di3E5IEFCdS6MVRR9q5F2T/ZNb
 xhCg==
X-Gm-Message-State: AGi0PuZWb6OmxQdRH6VvVz9uNz6BVCraOixC8LlTgojUvYZkuYJJ8vO3
 Ls44tXWKbrTO/dgYCjyqFQst2Yc3jBRuNyYmW2vVFaiV17x2WITpWFLVAviGNmSMLH6T6bnXJmW
 2VMIVaMZ8P3b2VNdxDOaocbNc9RqgUyp2+wVnpBfEvA==
X-Received: by 2002:ac8:2a68:: with SMTP id l37mr2685096qtl.77.1585832125791; 
 Thu, 02 Apr 2020 05:55:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypIXMZqUA9fKM7j4ZEayWbkOS+B21xqe6c1yw8l/odLb8QfoZiOhyPhHGMworIpfrO+SJx15Qg==
X-Received: by 2002:ac8:2a68:: with SMTP id l37mr2685076qtl.77.1585832125540; 
 Thu, 02 Apr 2020 05:55:25 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id x37sm3672315qtc.90.2020.04.02.05.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 05:55:24 -0700 (PDT)
Date: Thu, 2 Apr 2020 08:55:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] virtio/test: fix up after IOTLB changes
Message-ID: <20200402125406.9275-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, netdev@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

QWxsb3cgYnVpbGRpbmcgdnJpbmdoIHdpdGhvdXQgSU9UTEIgKHRoYXQncyB0aGUgY2FzZSBmb3Ig
dXNlcnNwYWNlCmJ1aWxkcywgd2lsbCBiZSB1c2VmdWwgZm9yIENBSUYvVk9EIGRvd24gdGhlIHJv
YWQgdG9vKS4KVXBkYXRlIGZvciBBUEkgdHdlYWtzLgpEb24ndCBpbmNsdWRlIHZyaW5naCB3aXRo
IHVzZXJzcGFjZSBidWlsZHMuCgpDYzogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4K
Q2M6IEV1Z2VuaW8gUMOpcmV6IDxlcGVyZXptYUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBN
aWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgotLS0KCmNoYW5nZXMgZnJvbSB2MToK
CXVzZSBJU19SRUFDSEVBQkxFIHRvIGZpeCBlcnJvciByZXBvcnRlZCBieSBidWlsZCBib3QKCiBk
cml2ZXJzL3Zob3N0L3Rlc3QuYyAgICAgICAgICAgICAgfCA0ICsrLS0KIGRyaXZlcnMvdmhvc3Qv
dnJpbmdoLmMgICAgICAgICAgICB8IDUgKysrKysKIGluY2x1ZGUvbGludXgvdnJpbmdoLmggICAg
ICAgICAgICB8IDYgKysrKysrCiB0b29scy92aXJ0aW8vTWFrZWZpbGUgICAgICAgICAgICAgfCA1
ICsrKy0tCiB0b29scy92aXJ0aW8vZ2VuZXJhdGVkL2F1dG9jb25mLmggfCAwCiA1IGZpbGVzIGNo
YW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2
NDQgdG9vbHMvdmlydGlvL2dlbmVyYXRlZC9hdXRvY29uZi5oCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aG9zdC90ZXN0LmMgYi9kcml2ZXJzL3Zob3N0L3Rlc3QuYwppbmRleCAzOTRlMmU1Yzc3MmQu
LjlhM2EwOTAwNWUwMyAxMDA2NDQKLS0tIGEvZHJpdmVycy92aG9zdC90ZXN0LmMKKysrIGIvZHJp
dmVycy92aG9zdC90ZXN0LmMKQEAgLTEyMCw3ICsxMjAsNyBAQCBzdGF0aWMgaW50IHZob3N0X3Rl
c3Rfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZikKIAl2cXNbVkhPU1Rf
VEVTVF9WUV0gPSAmbi0+dnFzW1ZIT1NUX1RFU1RfVlFdOwogCW4tPnZxc1tWSE9TVF9URVNUX1ZR
XS5oYW5kbGVfa2ljayA9IGhhbmRsZV92cV9raWNrOwogCXZob3N0X2Rldl9pbml0KGRldiwgdnFz
LCBWSE9TVF9URVNUX1ZRX01BWCwgVUlPX01BWElPViwKLQkJICAgICAgIFZIT1NUX1RFU1RfUEtU
X1dFSUdIVCwgVkhPU1RfVEVTVF9XRUlHSFQpOworCQkgICAgICAgVkhPU1RfVEVTVF9QS1RfV0VJ
R0hULCBWSE9TVF9URVNUX1dFSUdIVCwgTlVMTCk7CiAKIAlmLT5wcml2YXRlX2RhdGEgPSBuOwog
CkBAIC0yMjUsNyArMjI1LDcgQEAgc3RhdGljIGxvbmcgdmhvc3RfdGVzdF9yZXNldF9vd25lcihz
dHJ1Y3Qgdmhvc3RfdGVzdCAqbikKIHsKIAl2b2lkICpwcml2ID0gTlVMTDsKIAlsb25nIGVycjsK
LQlzdHJ1Y3Qgdmhvc3RfdW1lbSAqdW1lbTsKKwlzdHJ1Y3Qgdmhvc3RfaW90bGIgKnVtZW07CiAK
IAltdXRleF9sb2NrKCZuLT5kZXYubXV0ZXgpOwogCWVyciA9IHZob3N0X2Rldl9jaGVja19vd25l
cigmbi0+ZGV2KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvdnJpbmdoLmMgYi9kcml2ZXJz
L3Zob3N0L3ZyaW5naC5jCmluZGV4IGVlMDQ5MWY1NzlhYy4uYmE4ZTBkNmNmZDk3IDEwMDY0NAot
LS0gYS9kcml2ZXJzL3Zob3N0L3ZyaW5naC5jCisrKyBiL2RyaXZlcnMvdmhvc3QvdnJpbmdoLmMK
QEAgLTEzLDkgKzEzLDExIEBACiAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgogI2luY2x1ZGUg
PGxpbnV4L3NsYWIuaD4KICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KKyNpZiBJU19SRUFDSEFC
TEUoQ09ORklHX1ZIT1NUX0lPVExCKQogI2luY2x1ZGUgPGxpbnV4L2J2ZWMuaD4KICNpbmNsdWRl
IDxsaW51eC9oaWdobWVtLmg+CiAjaW5jbHVkZSA8bGludXgvdmhvc3RfaW90bGIuaD4KKyNlbmRp
ZgogI2luY2x1ZGUgPHVhcGkvbGludXgvdmlydGlvX2NvbmZpZy5oPgogCiBzdGF0aWMgX19wcmlu
dGYoMSwyKSBfX2NvbGQgdm9pZCB2cmluZ2hfYmFkKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQpAQCAt
MTA1OSw2ICsxMDYxLDggQEAgaW50IHZyaW5naF9uZWVkX25vdGlmeV9rZXJuKHN0cnVjdCB2cmlu
Z2ggKnZyaCkKIH0KIEVYUE9SVF9TWU1CT0wodnJpbmdoX25lZWRfbm90aWZ5X2tlcm4pOwogCisj
aWYgSVNfUkVBQ0hBQkxFKENPTkZJR19WSE9TVF9JT1RMQikKKwogc3RhdGljIGludCBpb3RsYl90
cmFuc2xhdGUoY29uc3Qgc3RydWN0IHZyaW5naCAqdnJoLAogCQkJICAgdTY0IGFkZHIsIHU2NCBs
ZW4sIHN0cnVjdCBiaW9fdmVjIGlvdltdLAogCQkJICAgaW50IGlvdl9zaXplLCB1MzIgcGVybSkK
QEAgLTE0MTYsNSArMTQyMCw2IEBAIGludCB2cmluZ2hfbmVlZF9ub3RpZnlfaW90bGIoc3RydWN0
IHZyaW5naCAqdnJoKQogfQogRVhQT1JUX1NZTUJPTCh2cmluZ2hfbmVlZF9ub3RpZnlfaW90bGIp
OwogCisjZW5kaWYKIAogTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOwpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC92cmluZ2guaCBiL2luY2x1ZGUvbGludXgvdnJpbmdoLmgKaW5kZXggYmQwNTAzY2E2
ZjhmLi45ZTI3NjNkN2MxNTkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvdnJpbmdoLmgKKysr
IGIvaW5jbHVkZS9saW51eC92cmluZ2guaApAQCAtMTQsOCArMTQsMTAgQEAKICNpbmNsdWRlIDxs
aW51eC92aXJ0aW9fYnl0ZW9yZGVyLmg+CiAjaW5jbHVkZSA8bGludXgvdWlvLmg+CiAjaW5jbHVk
ZSA8bGludXgvc2xhYi5oPgorI2lmIElTX1JFQUNIQUJMRShDT05GSUdfVkhPU1RfSU9UTEIpCiAj
aW5jbHVkZSA8bGludXgvZG1hLWRpcmVjdGlvbi5oPgogI2luY2x1ZGUgPGxpbnV4L3Zob3N0X2lv
dGxiLmg+CisjZW5kaWYKICNpbmNsdWRlIDxhc20vYmFycmllci5oPgogCiAvKiB2aXJ0aW9fcmlu
ZyB3aXRoIGluZm9ybWF0aW9uIG5lZWRlZCBmb3IgaG9zdCBhY2Nlc3MuICovCkBAIC0yNTQsNiAr
MjU2LDggQEAgc3RhdGljIGlubGluZSBfX3ZpcnRpbzY0IGNwdV90b192cmluZ2g2NChjb25zdCBz
dHJ1Y3QgdnJpbmdoICp2cmgsIHU2NCB2YWwpCiAJcmV0dXJuIF9fY3B1X3RvX3ZpcnRpbzY0KHZy
aW5naF9pc19saXR0bGVfZW5kaWFuKHZyaCksIHZhbCk7CiB9CiAKKyNpZiBJU19SRUFDSEFCTEUo
Q09ORklHX1ZIT1NUX0lPVExCKQorCiB2b2lkIHZyaW5naF9zZXRfaW90bGIoc3RydWN0IHZyaW5n
aCAqdnJoLCBzdHJ1Y3Qgdmhvc3RfaW90bGIgKmlvdGxiKTsKIAogaW50IHZyaW5naF9pbml0X2lv
dGxiKHN0cnVjdCB2cmluZ2ggKnZyaCwgdTY0IGZlYXR1cmVzLApAQCAtMjg0LDQgKzI4OCw2IEBA
IHZvaWQgdnJpbmdoX25vdGlmeV9kaXNhYmxlX2lvdGxiKHN0cnVjdCB2cmluZ2ggKnZyaCk7CiAK
IGludCB2cmluZ2hfbmVlZF9ub3RpZnlfaW90bGIoc3RydWN0IHZyaW5naCAqdnJoKTsKIAorI2Vu
ZGlmIC8qIENPTkZJR19WSE9TVF9JT1RMQiAqLworCiAjZW5kaWYgLyogX0xJTlVYX1ZSSU5HSF9I
ICovCmRpZmYgLS1naXQgYS90b29scy92aXJ0aW8vTWFrZWZpbGUgYi90b29scy92aXJ0aW8vTWFr
ZWZpbGUKaW5kZXggZjMzZjMyZjFkMjA4Li5iNTg3YjlhN2ExMjQgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L3ZpcnRpby9NYWtlZmlsZQorKysgYi90b29scy92aXJ0aW8vTWFrZWZpbGUKQEAgLTQsNyArNCw3
IEBAIHRlc3Q6IHZpcnRpb190ZXN0IHZyaW5naF90ZXN0CiB2aXJ0aW9fdGVzdDogdmlydGlvX3Jp
bmcubyB2aXJ0aW9fdGVzdC5vCiB2cmluZ2hfdGVzdDogdnJpbmdoX3Rlc3QubyB2cmluZ2gubyB2
aXJ0aW9fcmluZy5vCiAKLUNGTEFHUyArPSAtZyAtTzIgLVdlcnJvciAtV2FsbCAtSS4gLUkuLi9p
bmNsdWRlLyAtSSAuLi8uLi91c3IvaW5jbHVkZS8gLVduby1wb2ludGVyLXNpZ24gLWZuby1zdHJp
Y3Qtb3ZlcmZsb3cgLWZuby1zdHJpY3QtYWxpYXNpbmcgLWZuby1jb21tb24gLU1NRCAtVV9GT1JU
SUZZX1NPVVJDRQorQ0ZMQUdTICs9IC1nIC1PMiAtV2Vycm9yIC1XYWxsIC1JLiAtSS4uL2luY2x1
ZGUvIC1JIC4uLy4uL3Vzci9pbmNsdWRlLyAtV25vLXBvaW50ZXItc2lnbiAtZm5vLXN0cmljdC1v
dmVyZmxvdyAtZm5vLXN0cmljdC1hbGlhc2luZyAtZm5vLWNvbW1vbiAtTU1EIC1VX0ZPUlRJRllf
U09VUkNFIC1pbmNsdWRlIC4uLy4uL2luY2x1ZGUvbGludXgva2NvbmZpZy5oCiB2cGF0aCAlLmMg
Li4vLi4vZHJpdmVycy92aXJ0aW8gLi4vLi4vZHJpdmVycy92aG9zdAogbW9kOgogCSR7TUFLRX0g
LUMgYHB3ZGAvLi4vLi4gTT1gcHdkYC92aG9zdF90ZXN0IFY9JHtWfQpAQCAtMjIsNyArMjIsOCBA
QCBPT1RfQ09ORklHUz1cCiAJQ09ORklHX1ZIT1NUPW0gXAogCUNPTkZJR19WSE9TVF9ORVQ9biBc
CiAJQ09ORklHX1ZIT1NUX1NDU0k9biBcCi0JQ09ORklHX1ZIT1NUX1ZTT0NLPW4KKwlDT05GSUdf
VkhPU1RfVlNPQ0s9biBcCisJQ09ORklHX1ZIT1NUX1JJTkc9bgogT09UX0JVSUxEPUtDRkxBR1M9
Ii1JICIke09PVF9WSE9TVH0gJHtNQUtFfSAtQyAke09PVF9LU1JDfSBWPSR7Vn0KIG9vdC1idWls
ZDoKIAllY2hvICJVTlNVUFBPUlRFRCEgRG9uJ3QgdXNlIHRoZSByZXN1bHRpbmcgbW9kdWxlcyBp
biBwcm9kdWN0aW9uISIKZGlmZiAtLWdpdCBhL3Rvb2xzL3ZpcnRpby9nZW5lcmF0ZWQvYXV0b2Nv
bmYuaCBiL3Rvb2xzL3ZpcnRpby9nZW5lcmF0ZWQvYXV0b2NvbmYuaApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmU2OWRlMjliYjJkMQotLSAKTVNUCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
