Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B77912D1AD6
	for <lists.virtualization@lfdr.de>; Mon,  7 Dec 2020 21:46:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6CD84870BE;
	Mon,  7 Dec 2020 20:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T-qU93-XF4th; Mon,  7 Dec 2020 20:46:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B4C3A871A2;
	Mon,  7 Dec 2020 20:46:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CCECC013B;
	Mon,  7 Dec 2020 20:46:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE96FC013B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 995ED87938
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jpJuKXBET9ZR
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7B54D87899
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:19 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 DA2BA305D462; Mon,  7 Dec 2020 22:46:17 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id B5DF13072785;
 Mon,  7 Dec 2020 22:46:17 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v11 35/81] KVM: introspection: add the read/dispatch message
 function
Date: Mon,  7 Dec 2020 22:45:36 +0200
Message-Id: <20201207204622.15258-36-alazar@bitdefender.com>
In-Reply-To: <20201207204622.15258-1-alazar@bitdefender.com>
References: <20201207204622.15258-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtualization@lists.linux-foundation.org
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

QmFzZWQgb24gdGhlIGNvbW1vbiBoZWFkZXIgKHN0cnVjdCBrdm1pX21zZ19oZHIpLCB0aGUgcmVj
ZWl2aW5nIHRocmVhZAp3aWxsIHJlYWQvdmFsaWRhdGUgYWxsIG1lc3NhZ2VzLCBleGVjdXRlIHRo
ZSBWTSBpbnRyb3NwZWN0aW9uIGNvbW1hbmRzCihlZy4gS1ZNSV9WTV9HRVRfSU5GTykgYW5kIGRp
c3BhdGNoIHRoZSB2Q1BVIGludHJvc3BlY3Rpb24gY29tbWFuZHMKKGVnLiBLVk1JX1ZDUFVfR0VU
X1JFR0lTVEVSUykgdG8gdGhlIHZDUFUgdGhyZWFkcy4KClRoZSB2Q1BVIHRocmVhZHMgd2lsbCBy
ZXBseSB0byB2Q1BVIGludHJvc3BlY3Rpb24gY29tbWFuZHMgd2l0aG91dAp0aGUgaGVscCBvZiB0
aGUgcmVjZWl2aW5nIHRocmVhZC4gU2FtZSBmb3Igc2VuZGluZyB2Q1BVIGV2ZW50cywgYnV0CnRo
ZSB2Q1BVIHRocmVhZCB3aWxsIHdhaXQgZm9yIHRoZSByZWNlaXZpbmcgdGhyZWFkIHRvIGdldCB0
aGUgZXZlbnQKcmVwbHkuIE1lYW53aGlsZSwgaXQgd2lsbCBleGVjdXRlIGFueSBxdWV1ZWQgdkNQ
VSBpbnRyb3NwZWN0aW9uIGNvbW1hbmQuCgpUaGUgcmVjZWl2aW5nIHRocmVhZCB3aWxsIGVuZCB3
aGVuIHRoZSBzb2NrZXQgaXMgY2xvc2VkIG9yIG9uIHRoZSBmaXJzdApBUEkgZXJyb3IgKGVnLiB3
cm9uZyBtZXNzYWdlIHNpemUpLgoKU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6
YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIERvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3Qg
ICAgICAgICAgICAgICB8ICA3NSArKysrKysrKwogaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaCAg
ICAgICAgICAgICAgICAgICAgIHwgIDExICsrCiAuLi4vdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4
Nl82NC9rdm1pX3Rlc3QuYyAgfCAxMDAgKysrKysrKysrKysKIHZpcnQva3ZtL2ludHJvc3BlY3Rp
b24va3ZtaS5jICAgICAgICAgICAgICAgICB8ICA0MyArKysrLQogdmlydC9rdm0vaW50cm9zcGVj
dGlvbi9rdm1pX2ludC5oICAgICAgICAgICAgIHwgIDEwICsrCiB2aXJ0L2t2bS9pbnRyb3NwZWN0
aW9uL2t2bWlfbXNnLmMgICAgICAgICAgICAgfCAxNjEgKysrKysrKysrKysrKysrKystCiA2IGZp
bGVzIGNoYW5nZWQsIDM5OCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZpcnQv
a3ZtL2t2bWkucnN0CmluZGV4IDU5Y2MzM2EzOWY5Zi4uYWU2YmJmMzdhZWYzIDEwMDY0NAotLS0g
YS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0CisrKyBiL0RvY3VtZW50YXRpb24vdmly
dC9rdm0va3ZtaS5yc3QKQEAgLTY1LDYgKzY1LDc0IEBAIGJlZW4gdXNlZCBvbiB0aGF0IGd1ZXN0
IChpZiByZXF1ZXN0ZWQpLiBPYnZpb3VzbHksIHdoZXRoZXIgdGhlIGd1ZXN0IGNhbgogcmVhbGx5
IGNvbnRpbnVlIG5vcm1hbCBleGVjdXRpb24gZGVwZW5kcyBvbiB3aGV0aGVyIHRoZSBpbnRyb3Nw
ZWN0aW9uCiB0b29sIGhhcyBtYWRlIGFueSBtb2RpZmljYXRpb25zIHRoYXQgcmVxdWlyZSBhbiBh
Y3RpdmUgS1ZNSSBjaGFubmVsLgogCitBbGwgbWVzc2FnZXMgKGNvbW1hbmRzIG9yIGV2ZW50cykg
aGF2ZSBhIGNvbW1vbiBoZWFkZXI6OgorCisJc3RydWN0IGt2bWlfbXNnX2hkciB7CisJCV9fdTE2
IGlkOworCQlfX3UxNiBzaXplOworCQlfX3UzMiBzZXE7CisJfTsKKworVGhlIHJlcGxpZXMgaGF2
ZSB0aGUgc2FtZSBoZWFkZXIsIHdpdGggdGhlIHNlcXVlbmNlIG51bWJlciAoYGBzZXFgYCkKK2Fu
ZCBtZXNzYWdlIGlkIChgYGlkYGApIG1hdGNoaW5nIHRoZSBjb21tYW5kL2V2ZW50LgorCitBZnRl
ciBgYGt2bWlfbXNnX2hkcmBgLCBgYGlkYGAgc3BlY2lmaWMgZGF0YSBvZiBgYHNpemVgYCBieXRl
cyB3aWxsCitmb2xsb3cuCisKK1RoZSBtZXNzYWdlIGhlYWRlciBhbmQgaXRzIGRhdGEgbXVzdCBi
ZSBzZW50IHdpdGggb25lIGBgc2VuZG1zZygpYGAgY2FsbAordG8gdGhlIHNvY2tldC4gVGhpcyBz
aW1wbGlmaWVzIHRoZSByZWNlaXZlciBsb29wIGFuZCBhdm9pZHMKK3RoZSByZWNvbnN0cnVjdGlv
biBvZiBtZXNzYWdlcyBvbiB0aGUgb3RoZXIgc2lkZS4KKworVGhlIHdpcmUgcHJvdG9jb2wgdXNl
cyB0aGUgaG9zdCBuYXRpdmUgYnl0ZS1vcmRlci4gVGhlIGludHJvc3BlY3Rpb24gdG9vbAorbXVz
dCBjaGVjayB0aGlzIGR1cmluZyB0aGUgaGFuZHNoYWtlIGFuZCBkbyB0aGUgbmVjZXNzYXJ5IGNv
bnZlcnNpb24uCisKK0EgY29tbWFuZCByZXBseSBiZWdpbnMgd2l0aDo6CisKKwlzdHJ1Y3Qga3Zt
aV9lcnJvcl9jb2RlIHsKKwkJX19zMzIgZXJyOworCQlfX3UzMiBwYWRkaW5nOworCX0KKworZm9s
bG93ZWQgYnkgdGhlIGNvbW1hbmQgc3BlY2lmaWMgZGF0YSBpZiB0aGUgZXJyb3IgY29kZSBgYGVy
cmBgIGlzIHplcm8uCisKK1RoZSBlcnJvciBjb2RlIC1LVk1fRU5PU1lTIGlzIHJldHVybmVkIGZv
ciB1bnN1cHBvcnRlZCBjb21tYW5kcy4KKworVGhlIGVycm9yIGNvZGUgLUtWTV9FUEVSTSBpcyBy
ZXR1cm5lZCBmb3IgZGlzYWxsb3dlZCBjb21tYW5kcyAoc2VlICoqSG9va2luZyoqKS4KKworT3Ro
ZXIgZXJyb3IgY29kZXMgY2FuIGJlIHJldHVybmVkIGR1cmluZyBtZXNzYWdlIGhhbmRsaW5nLCBi
dXQgZm9yCitzb21lIGVycm9ycyAoaW5jb21wbGV0ZSBtZXNzYWdlcywgd3Jvbmcgc2VxdWVuY2Ug
bnVtYmVycywgc29ja2V0IGVycm9ycworZXRjLikgdGhlIHNvY2tldCB3aWxsIGJlIGNsb3NlZC4g
VGhlIGRldmljZSBtYW5hZ2VyIHNob3VsZCByZWNvbm5lY3QuCisKK1doZW4gYSB2Q1BVIHRocmVh
ZCBzZW5kcyBhbiBpbnRyb3NwZWN0aW9uIGV2ZW50LCBpdCB3aWxsIHdhaXQgKGFuZCBoYW5kbGUK
K2FueSByZWxhdGVkIGludHJvc3BlY3Rpb24gY29tbWFuZCkgdW50aWwgaXQgZ2V0cyB0aGUgZXZl
bnQgcmVwbHk6OgorCisgICBIb3N0IGtlcm5lbCAgICAgICAgICAgICAgIEludHJvc3BlY3Rpb24g
dG9vbAorICAgLS0tLS0tLS0tLS0gICAgICAgICAgICAgICAtLS0tLS0tLS0tLS0tLS0tLS0KKyAg
IGV2ZW50IDEgLT4KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC0gY29tbWFuZCAxCisg
ICBjb21tYW5kIDEgcmVwbHkgLT4KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC0gY29t
bWFuZCAyCisgICBjb21tYW5kIDIgcmVwbHkgLT4KKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPC0gZXZlbnQgMSByZXBseQorCitBcyBpdCBjYW4gYmUgc2VlbiBiZWxvdywgdGhlIHdpcmUg
cHJvdG9jb2wgc3BlY2lmaWVzIG9jY2FzaW9uYWwgcGFkZGluZy4gVGhpcworaXMgdG8gcGVybWl0
IHdvcmtpbmcgd2l0aCB0aGUgZGF0YSBieSBkaXJlY3RseSB1c2luZyBDIHN0cnVjdHVyZXMgb3Ig
dG8gcm91bmQKK3RoZSBzdHJ1Y3R1cmUgc2l6ZSB0byBhIG11bHRpcGxlIG9mIDggYnl0ZXMgKDY0
Yml0KSB0byBpbXByb3ZlIHRoZSBjb3B5CitvcGVyYXRpb25zIHRoYXQgaGFwcGVuIGR1cmluZyBg
YHJlY3Ztc2coKWBgIG9yIGBgc2VuZG1zZygpYGAuIFRoZSBtZW1iZXJzCitzaG91bGQgaGF2ZSB0
aGUgbmF0aXZlIGFsaWdubWVudCBvZiB0aGUgaG9zdC4gQWxsIHBhZGRpbmcgbXVzdCBiZQoraW5p
dGlhbGl6ZWQgd2l0aCB6ZXJvIG90aGVyd2lzZSB0aGUgcmVzcGVjdGl2ZSBjb21tYW5kIHdpbGwg
ZmFpbCB3aXRoCistS1ZNX0VJTlZBTC4KKworVG8gZGVzY3JpYmUgdGhlIGNvbW1hbmRzL2V2ZW50
cywgd2UgcmV1c2Ugc29tZSBjb252ZW50aW9ucyBmcm9tIGFwaS5yc3Q6CisKKyAgLSBBcmNoaXRl
Y3R1cmVzOiB3aGljaCBpbnN0cnVjdGlvbiBzZXQgYXJjaGl0ZWN0dXJlcyBwcm92aWRlIHRoaXMg
Y29tbWFuZC9ldmVudAorCisgIC0gVmVyc2lvbnM6IHdoaWNoIHZlcnNpb25zIHByb3ZpZGUgdGhp
cyBjb21tYW5kL2V2ZW50CisKKyAgLSBQYXJhbWV0ZXJzOiBpbmNvbWluZyBtZXNzYWdlIGRhdGEK
KworICAtIFJldHVybnM6IG91dGdvaW5nL3JlcGx5IG1lc3NhZ2UgZGF0YQorCiBIYW5kc2hha2UK
IC0tLS0tLS0tLQogCkBAIC05OSw2ICsxNjcsMTMgQEAgSW4gdGhlIGVuZCwgdGhlIGRldmljZSBt
YW5hZ2VyIHdpbGwgcGFzcyB0aGUgZmlsZSBkZXNjcmlwdG9yIChwbHVzCiB0aGUgYWxsb3dlZCBj
b21tYW5kcy9ldmVudHMpIHRvIEtWTS4gSXQgd2lsbCBkZXRlY3Qgd2hlbiB0aGUgc29ja2V0IGlz
CiBzaHV0ZG93biBhbmQgaXQgd2lsbCByZWluaXRpYXRlIHRoZSBoYW5kc2hha2UuCiAKK09uY2Ug
dGhlIGZpbGUgZGVzY3JpcHRvciByZWFjaGVzIEtWTSwgdGhlIGludHJvc3BlY3Rpb24gdG9vbCBz
aG91bGQKK3VzZSB0aGUgKktWTUlfR0VUX1ZFUlNJT04qIGNvbW1hbmQgdG8gZ2V0IHRoZSBBUEkg
dmVyc2lvbiBhbmQvb3IgdGhlCisqS1ZNSV9WTV9DSEVDS19DT01NQU5EKiBhbmQgKktWTUlfVk1f
Q0hFQ0tfRVZFTlQqIGNvbW1hbmRzIHRvIHNlZSB3aGljaAorY29tbWFuZHMvZXZlbnRzIGFyZSBh
bGxvd2VkIGZvciB0aGlzIGd1ZXN0LiBUaGUgZXJyb3IgY29kZSAtS1ZNX0VQRVJNCit3aWxsIGJl
IHJldHVybmVkIGlmIHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgdXNlcyBhIGNvbW1hbmQgb3IgdHJp
ZXMgdG8KK2VuYWJsZSBhbiBldmVudCB3aGljaCBpcyBkaXNhbGxvd2VkLgorCiBVbmhvb2tpbmcK
IC0tLS0tLS0tLQogCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oIGIvaW5j
bHVkZS91YXBpL2xpbnV4L2t2bWkuaAppbmRleCA4NWY4NjIyZGRmOTUuLjJiMzdlZWU4MmM1MiAx
MDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAorKysgYi9pbmNsdWRlL3VhcGkv
bGludXgva3ZtaS5oCkBAIC0zMiw0ICszMiwxNSBAQCBlbnVtIHsKIAlLVk1JX05FWFRfVkNQVV9F
VkVOVAogfTsKIAorc3RydWN0IGt2bWlfbXNnX2hkciB7CisJX191MTYgaWQ7CisJX191MTYgc2l6
ZTsKKwlfX3UzMiBzZXE7Cit9OworCitzdHJ1Y3Qga3ZtaV9lcnJvcl9jb2RlIHsKKwlfX3MzMiBl
cnI7CisJX191MzIgcGFkZGluZzsKK307CisKICNlbmRpZiAvKiBfVUFQSV9fTElOVVhfS1ZNSV9I
ICovCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlf
dGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYwpp
bmRleCBhYzhmNjU4OTk5ZjguLjk1YmQwYTYwZWI0NyAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYworKysgYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jCkBAIC0xNSw2ICsxNSw3IEBACiAjaW5jbHVk
ZSAicHJvY2Vzc29yLmgiCiAjaW5jbHVkZSAiLi4vbGliL2t2bV91dGlsX2ludGVybmFsLmgiCiAK
KyNpbmNsdWRlICJsaW51eC9rdm1fcGFyYS5oIgogI2luY2x1ZGUgImxpbnV4L2t2bWkuaCIKIAog
I2RlZmluZSBWQ1BVX0lEIDEKQEAgLTExMCwxMCArMTExLDEwOSBAQCBzdGF0aWMgdm9pZCB1bmhv
b2tfaW50cm9zcGVjdGlvbihzdHJ1Y3Qga3ZtX3ZtICp2bSkKIAkJZXJybm8sIHN0cmVycm9yKGVy
cm5vKSk7CiB9CiAKK3N0YXRpYyB2b2lkIHJlY2VpdmVfZGF0YSh2b2lkICpkZXN0LCBzaXplX3Qg
c2l6ZSkKK3sKKwlzc2l6ZV90IHI7CisKKwlyID0gcmVjdihVc2Vyc3BhY2Vfc29ja2V0LCBkZXN0
LCBzaXplLCBNU0dfV0FJVEFMTCk7CisJVEVTVF9BU1NFUlQociA9PSBzaXplLAorCQkicmVjdigp
IGZhaWxlZCwgZXhwZWN0ZWQgJXpkLCByZXN1bHQgJXpkLCBlcnJubyAlZCAoJXMpXG4iLAorCQlz
aXplLCByLCBlcnJubywgc3RyZXJyb3IoZXJybm8pKTsKK30KKworc3RhdGljIGludCByZWNlaXZl
X2NtZF9yZXBseShzdHJ1Y3Qga3ZtaV9tc2dfaGRyICpyZXEsIHZvaWQgKnJwbCwKKwkJCSAgICAg
c2l6ZV90IHJwbF9zaXplKQoreworCXN0cnVjdCBrdm1pX21zZ19oZHIgaGRyOworCXN0cnVjdCBr
dm1pX2Vycm9yX2NvZGUgZWM7CisKKwlyZWNlaXZlX2RhdGEoJmhkciwgc2l6ZW9mKGhkcikpOwor
CisJVEVTVF9BU1NFUlQoaGRyLnNlcSA9PSByZXEtPnNlcSwKKwkJIlVuZXhwZWN0ZWQgbWVzc2Fn
ZXMgc2VxdWVuY2UgMHgleCwgZXhwZWN0ZWQgMHgleFxuIiwKKwkJaGRyLnNlcSwgcmVxLT5zZXEp
OworCisJVEVTVF9BU1NFUlQoaGRyLnNpemUgPj0gc2l6ZW9mKGVjKSwKKwkJIkludmFsaWQgbWVz
c2FnZSBzaXplICVkLCBleHBlY3RlZCAlemQgYnl0ZXMgKGF0IGxlYXN0KVxuIiwKKwkJaGRyLnNp
emUsIHNpemVvZihlYykpOworCisJcmVjZWl2ZV9kYXRhKCZlYywgc2l6ZW9mKGVjKSk7CisKKwlp
ZiAoZWMuZXJyKSB7CisJCVRFU1RfQVNTRVJUKGhkci5zaXplID09IHNpemVvZihlYyksCisJCQki
SW52YWxpZCBjb21tYW5kIHJlcGx5IG9uIGVycm9yXG4iKTsKKwl9IGVsc2UgeworCQlURVNUX0FT
U0VSVChoZHIuc2l6ZSA9PSBzaXplb2YoZWMpICsgcnBsX3NpemUsCisJCQkiSW52YWxpZCBjb21t
YW5kIHJlcGx5XG4iKTsKKworCQlpZiAocnBsICYmIHJwbF9zaXplKQorCQkJcmVjZWl2ZV9kYXRh
KHJwbCwgcnBsX3NpemUpOworCX0KKworCXJldHVybiBlYy5lcnI7Cit9CisKK3N0YXRpYyB1bnNp
Z25lZCBpbnQgbmV3X3NlcSh2b2lkKQoreworCXN0YXRpYyB1bnNpZ25lZCBpbnQgc2VxOworCisJ
cmV0dXJuIHNlcSsrOworfQorCitzdGF0aWMgdm9pZCBzZW5kX21lc3NhZ2UoaW50IG1zZ19pZCwg
c3RydWN0IGt2bWlfbXNnX2hkciAqaGRyLCBzaXplX3Qgc2l6ZSkKK3sKKwlzc2l6ZV90IHI7CisK
KwloZHItPmlkID0gbXNnX2lkOworCWhkci0+c2VxID0gbmV3X3NlcSgpOworCWhkci0+c2l6ZSA9
IHNpemUgLSBzaXplb2YoKmhkcik7CisKKwlyID0gc2VuZChVc2Vyc3BhY2Vfc29ja2V0LCBoZHIs
IHNpemUsIDApOworCVRFU1RfQVNTRVJUKHIgPT0gc2l6ZSwKKwkJInNlbmQoKSBmYWlsZWQsIHNl
bmRpbmcgJXpkLCByZXN1bHQgJXpkLCBlcnJubyAlZCAoJXMpXG4iLAorCQlzaXplLCByLCBlcnJu
bywgc3RyZXJyb3IoZXJybm8pKTsKK30KKworc3RhdGljIGNvbnN0IGNoYXIgKmt2bV9zdHJlcnJv
cihpbnQgZXJyb3IpCit7CisJc3dpdGNoIChlcnJvcikgeworCWNhc2UgS1ZNX0VOT1NZUzoKKwkJ
cmV0dXJuICJJbnZhbGlkIHN5c3RlbSBjYWxsIG51bWJlciI7CisJY2FzZSBLVk1fRU9QTk9UU1VQ
UDoKKwkJcmV0dXJuICJPcGVyYXRpb24gbm90IHN1cHBvcnRlZCBvbiB0cmFuc3BvcnQgZW5kcG9p
bnQiOworCWNhc2UgS1ZNX0VBR0FJTjoKKwkJcmV0dXJuICJUcnkgYWdhaW4iOworCWRlZmF1bHQ6
CisJCXJldHVybiBzdHJlcnJvcihlcnJvcik7CisJfQorfQorCitzdGF0aWMgaW50IGRvX2NvbW1h
bmQoaW50IGNtZF9pZCwgc3RydWN0IGt2bWlfbXNnX2hkciAqcmVxLAorCQkgICAgICBzaXplX3Qg
cmVxX3NpemUsIHZvaWQgKnJwbCwgc2l6ZV90IHJwbF9zaXplKQoreworCXNlbmRfbWVzc2FnZShj
bWRfaWQsIHJlcSwgcmVxX3NpemUpOworCXJldHVybiByZWNlaXZlX2NtZF9yZXBseShyZXEsIHJw
bCwgcnBsX3NpemUpOworfQorCitzdGF0aWMgdm9pZCB0ZXN0X2NtZF9pbnZhbGlkKHZvaWQpCit7
CisJaW50IGludmFsaWRfbXNnX2lkID0gMHhmZmZmOworCXN0cnVjdCBrdm1pX21zZ19oZHIgcmVx
OworCWludCByOworCisJciA9IGRvX2NvbW1hbmQoaW52YWxpZF9tc2dfaWQsICZyZXEsIHNpemVv
ZihyZXEpLCBOVUxMLCAwKTsKKwlURVNUX0FTU0VSVChyID09IC1LVk1fRU5PU1lTLAorCQkiSW52
YWxpZCBjb21tYW5kIGRpZG4ndCBmYWlsZWQgd2l0aCBLVk1fRU5PU1lTLCBlcnJvciAlZCAoJXMp
XG4iLAorCQktciwga3ZtX3N0cmVycm9yKC1yKSk7Cit9CisKIHN0YXRpYyB2b2lkIHRlc3RfaW50
cm9zcGVjdGlvbihzdHJ1Y3Qga3ZtX3ZtICp2bSkKIHsKIAlzZXR1cF9zb2NrZXQoKTsKIAlob29r
X2ludHJvc3BlY3Rpb24odm0pOworCisJdGVzdF9jbWRfaW52YWxpZCgpOworCiAJdW5ob29rX2lu
dHJvc3BlY3Rpb24odm0pOwogfQogCmRpZmYgLS1naXQgYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9u
L2t2bWkuYyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jCmluZGV4IDk1NGQxNDIwZGI3
MS4uMzFmMmIzZTFiYzQzIDEwMDY0NAotLS0gYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWku
YworKysgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYwpAQCAtMTMsOSArMTMsNDkgQEAK
ICNkZWZpbmUgS1ZNSV9OVU1fRVZFTlRTICAgX19jbXAoKGludClLVk1JX05FWFRfVk1fRVZFTlQs
IFwKIAkJCQkoaW50KUtWTUlfTkVYVF9WQ1BVX0VWRU5ULCA+KQogCisjZGVmaW5lIEtWTUlfTVNH
X1NJWkVfQUxMT0MgKHNpemVvZihzdHJ1Y3Qga3ZtaV9tc2dfaGRyKSArIEtWTUlfTUFYX01TR19T
SVpFKQorCitzdGF0aWMgc3RydWN0IGttZW1fY2FjaGUgKm1zZ19jYWNoZTsKKwordm9pZCAqa3Zt
aV9tc2dfYWxsb2Modm9pZCkKK3sKKwlyZXR1cm4ga21lbV9jYWNoZV96YWxsb2MobXNnX2NhY2hl
LCBHRlBfS0VSTkVMKTsKK30KKwordm9pZCBrdm1pX21zZ19mcmVlKHZvaWQgKmFkZHIpCit7CisJ
aWYgKGFkZHIpCisJCWttZW1fY2FjaGVfZnJlZShtc2dfY2FjaGUsIGFkZHIpOworfQorCitzdGF0
aWMgdm9pZCBrdm1pX2NhY2hlX2Rlc3Ryb3kodm9pZCkKK3sKKwlrbWVtX2NhY2hlX2Rlc3Ryb3ko
bXNnX2NhY2hlKTsKKwltc2dfY2FjaGUgPSBOVUxMOworfQorCitzdGF0aWMgaW50IGt2bWlfY2Fj
aGVfY3JlYXRlKHZvaWQpCit7CisJbXNnX2NhY2hlID0ga21lbV9jYWNoZV9jcmVhdGUoImt2bWlf
bXNnIiwgS1ZNSV9NU0dfU0laRV9BTExPQywKKwkJCQkgICAgICA0MDk2LCBTTEFCX0FDQ09VTlQs
IE5VTEwpOworCisJaWYgKCFtc2dfY2FjaGUpIHsKKwkJa3ZtaV9jYWNoZV9kZXN0cm95KCk7CisK
KwkJcmV0dXJuIC0xOworCX0KKworCXJldHVybiAwOworfQorCitib29sIGt2bWlfaXNfY29tbWFu
ZF9hbGxvd2VkKHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwgdTE2IGlkKQoreworCXJl
dHVybiBpZCA8IEtWTUlfTlVNX0NPTU1BTkRTICYmIHRlc3RfYml0KGlkLCBrdm1pLT5jbWRfYWxs
b3dfbWFzayk7Cit9CisKIGludCBrdm1pX2luaXQodm9pZCkKIHsKLQlyZXR1cm4gMDsKKwlyZXR1
cm4ga3ZtaV9jYWNoZV9jcmVhdGUoKTsKIH0KIAogaW50IGt2bWlfdmVyc2lvbih2b2lkKQpAQCAt
MjUsNiArNjUsNyBAQCBpbnQga3ZtaV92ZXJzaW9uKHZvaWQpCiAKIHZvaWQga3ZtaV91bmluaXQo
dm9pZCkKIHsKKwlrdm1pX2NhY2hlX2Rlc3Ryb3koKTsKIH0KIAogc3RhdGljIHZvaWQga3ZtaV9m
cmVlKHN0cnVjdCBrdm0gKmt2bSkKZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24v
a3ZtaV9pbnQuaCBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaAppbmRleCBjODk4
NzViZDJiYWMuLjIwNmFhZjkzZjhiYSAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9zcGVjdGlv
bi9rdm1pX2ludC5oCisrKyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaApAQCAt
Nyw2ICs3LDExIEBACiAjaW5jbHVkZSA8dWFwaS9saW51eC9rdm1pLmg+CiAKICNkZWZpbmUgS1ZN
SShrdm0pICgoa3ZtKS0+a3ZtaSkKKy8qCisgKiBUaGlzIGxpbWl0IGlzIHVzZWQgdG8gYWNjb21t
b2RhdGUgdGhlIGxhcmdlc3Qga25vd24gZml4ZWQtbGVuZ3RoCisgKiBtZXNzYWdlLgorICovCisj
ZGVmaW5lIEtWTUlfTUFYX01TR19TSVpFICg0MDk2ICogMiAtIHNpemVvZihzdHJ1Y3Qga3ZtaV9t
c2dfaGRyKSkKIAogLyoga3ZtaV9tc2cuYyAqLwogYm9vbCBrdm1pX3NvY2tfZ2V0KHN0cnVjdCBr
dm1faW50cm9zcGVjdGlvbiAqa3ZtaSwgaW50IGZkKTsKQEAgLTE0LDQgKzE5LDkgQEAgdm9pZCBr
dm1pX3NvY2tfc2h1dGRvd24oc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pKTsKIHZvaWQg
a3ZtaV9zb2NrX3B1dChzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWkpOwogYm9vbCBrdm1p
X21zZ19wcm9jZXNzKHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSk7CiAKKy8qIGt2bWku
YyAqLwordm9pZCAqa3ZtaV9tc2dfYWxsb2Modm9pZCk7Cit2b2lkIGt2bWlfbXNnX2ZyZWUodm9p
ZCAqYWRkcik7Citib29sIGt2bWlfaXNfY29tbWFuZF9hbGxvd2VkKHN0cnVjdCBrdm1faW50cm9z
cGVjdGlvbiAqa3ZtaSwgdTE2IGlkKTsKKwogI2VuZGlmCmRpZmYgLS1naXQgYS92aXJ0L2t2bS9p
bnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNn
LmMKaW5kZXggM2FlNTJjNjFmODYxLi4zOGE1YTRhODRkNWQgMTAwNjQ0Ci0tLSBhL3ZpcnQva3Zt
L2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYworKysgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2
bWlfbXNnLmMKQEAgLTgsNiArOCwxMCBAQAogI2luY2x1ZGUgPGxpbnV4L25ldC5oPgogI2luY2x1
ZGUgImt2bWlfaW50LmgiCiAKK3R5cGVkZWYgaW50ICgqa3ZtaV92bV9tc2dfZmN0KShzdHJ1Y3Qg
a3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksCisJCQkgICAgICAgY29uc3Qgc3RydWN0IGt2bWlfbXNn
X2hkciAqbXNnLAorCQkJICAgICAgIGNvbnN0IHZvaWQgKnJlcSk7CisKIGJvb2wga3ZtaV9zb2Nr
X2dldChzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksIGludCBmZCkKIHsKIAlzdHJ1Y3Qg
c29ja2V0ICpzb2NrOwpAQCAtMzMsNyArMzcsMTYyIEBAIHZvaWQga3ZtaV9zb2NrX3NodXRkb3du
KHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSkKIAlrZXJuZWxfc29ja19zaHV0ZG93bihr
dm1pLT5zb2NrLCBTSFVUX1JEV1IpOwogfQogCitzdGF0aWMgaW50IGhhbmRsZV9zb2NrX3JjKGlu
dCByYywgc2l6ZV90IHNpemUpCit7CisJaWYgKHVubGlrZWx5KHJjIDwgMCkpCisJCXJldHVybiBy
YzsKKwlpZiAodW5saWtlbHkocmMgIT0gc2l6ZSkpCisJCXJldHVybiAtRVBJUEU7CisJcmV0dXJu
IDA7Cit9CisKK3N0YXRpYyBpbnQga3ZtaV9zb2NrX3JlYWQoc3RydWN0IGt2bV9pbnRyb3NwZWN0
aW9uICprdm1pLCB2b2lkICpidWYsCisJCQkgIHNpemVfdCBzaXplKQoreworCXN0cnVjdCBrdmVj
IHZlYyA9IHsgLmlvdl9iYXNlID0gYnVmLCAuaW92X2xlbiA9IHNpemUsIH07CisJc3RydWN0IG1z
Z2hkciBtID0geyB9OworCWludCByYzsKKworCXJjID0ga2VybmVsX3JlY3Ztc2coa3ZtaS0+c29j
aywgJm0sICZ2ZWMsIDEsIHNpemUsIE1TR19XQUlUQUxMKTsKKworCXJldHVybiBoYW5kbGVfc29j
a19yYyhyYywgc2l6ZSk7Cit9CisKK3N0YXRpYyBpbnQga3ZtaV9zb2NrX3dyaXRlKHN0cnVjdCBr
dm1faW50cm9zcGVjdGlvbiAqa3ZtaSwgc3RydWN0IGt2ZWMgKnZlYywKKwkJCSAgIHNpemVfdCBu
LCBzaXplX3Qgc2l6ZSkKK3sKKwlzdHJ1Y3QgbXNnaGRyIG0gPSB7IH07CisJaW50IHJjOworCisJ
cmMgPSBrZXJuZWxfc2VuZG1zZyhrdm1pLT5zb2NrLCAmbSwgdmVjLCBuLCBzaXplKTsKKworCXJl
dHVybiBoYW5kbGVfc29ja19yYyhyYywgc2l6ZSk7Cit9CisKK3N0YXRpYyBpbnQga3ZtaV9tc2df
cmVwbHkoc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pLAorCQkJICBjb25zdCBzdHJ1Y3Qg
a3ZtaV9tc2dfaGRyICptc2csIGludCBlcnIsCisJCQkgIGNvbnN0IHZvaWQgKnJwbCwgc2l6ZV90
IHJwbF9zaXplKQoreworCXN0cnVjdCBrdm1pX2Vycm9yX2NvZGUgZWM7CisJc3RydWN0IGt2bWlf
bXNnX2hkciBoOworCXN0cnVjdCBrdmVjIHZlY1szXSA9IHsKKwkJeyAuaW92X2Jhc2UgPSAmaCwg
Lmlvdl9sZW4gPSBzaXplb2YoaCkgfSwKKwkJeyAuaW92X2Jhc2UgPSAmZWMsIC5pb3ZfbGVuID0g
c2l6ZW9mKGVjKSB9LAorCQl7IC5pb3ZfYmFzZSA9ICh2b2lkICopcnBsLCAuaW92X2xlbiA9IHJw
bF9zaXplIH0sCisJfTsKKwlzaXplX3Qgc2l6ZSA9IHNpemVvZihoKSArIHNpemVvZihlYykgKyAo
ZXJyID8gMCA6IHJwbF9zaXplKTsKKwlzaXplX3QgbiA9IEFSUkFZX1NJWkUodmVjKSAtIChlcnIg
PyAxIDogMCk7CisKKwltZW1zZXQoJmgsIDAsIHNpemVvZihoKSk7CisJaC5pZCA9IG1zZy0+aWQ7
CisJaC5zZXEgPSBtc2ctPnNlcTsKKwloLnNpemUgPSBzaXplIC0gc2l6ZW9mKGgpOworCisJbWVt
c2V0KCZlYywgMCwgc2l6ZW9mKGVjKSk7CisJZWMuZXJyID0gZXJyOworCisJcmV0dXJuIGt2bWlf
c29ja193cml0ZShrdm1pLCB2ZWMsIG4sIHNpemUpOworfQorCitzdGF0aWMgaW50IGt2bWlfbXNn
X3ZtX3JlcGx5KHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwKKwkJCSAgICAgY29uc3Qg
c3RydWN0IGt2bWlfbXNnX2hkciAqbXNnLAorCQkJICAgICBpbnQgZXJyLCBjb25zdCB2b2lkICpy
cGwsCisJCQkgICAgIHNpemVfdCBycGxfc2l6ZSkKK3sKKwlyZXR1cm4ga3ZtaV9tc2dfcmVwbHko
a3ZtaSwgbXNnLCBlcnIsIHJwbCwgcnBsX3NpemUpOworfQorCisvKgorICogVGhlc2UgY29tbWFu
ZHMgYXJlIGV4ZWN1dGVkIGJ5IHRoZSByZWNlaXZpbmcgdGhyZWFkLgorICovCitzdGF0aWMga3Zt
aV92bV9tc2dfZmN0IGNvbnN0IG1zZ192bVtdID0geworfTsKKworc3RhdGljIGt2bWlfdm1fbXNn
X2ZjdCBnZXRfdm1fbXNnX2hhbmRsZXIodTE2IGlkKQoreworCXJldHVybiBpZCA8IEFSUkFZX1NJ
WkUobXNnX3ZtKSA/IG1zZ192bVtpZF0gOiBOVUxMOworfQorCitzdGF0aWMgYm9vbCBpc192bV9t
ZXNzYWdlKHUxNiBpZCkKK3sKKwlib29sIGlzX3ZtX21zZ19pZCA9IChpZCAmIDEpID09IDA7CisK
KwlyZXR1cm4gaXNfdm1fbXNnX2lkICYmICEhZ2V0X3ZtX21zZ19oYW5kbGVyKGlkKTsKK30KKwor
c3RhdGljIGJvb2wgaXNfdm1fY29tbWFuZCh1MTYgaWQpCit7CisJcmV0dXJuIGlzX3ZtX21lc3Nh
Z2UoaWQpOworfQorCitzdGF0aWMgc3RydWN0IGt2bWlfbXNnX2hkciAqa3ZtaV9tc2dfcmVjdihz
dHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWkpCit7CisJc3RydWN0IGt2bWlfbXNnX2hkciAq
bXNnOworCWludCBlcnI7CisKKwltc2cgPSBrdm1pX21zZ19hbGxvYygpOworCWlmICghbXNnKQor
CQlnb3RvIG91dDsKKworCWVyciA9IGt2bWlfc29ja19yZWFkKGt2bWksIG1zZywgc2l6ZW9mKCpt
c2cpKTsKKwlpZiAoZXJyKQorCQlnb3RvIG91dF9lcnI7CisKKwlpZiAobXNnLT5zaXplKSB7CisJ
CWlmIChtc2ctPnNpemUgPiBLVk1JX01BWF9NU0dfU0laRSkKKwkJCWdvdG8gb3V0X2VycjsKKwor
CQllcnIgPSBrdm1pX3NvY2tfcmVhZChrdm1pLCBtc2cgKyAxLCBtc2ctPnNpemUpOworCQlpZiAo
ZXJyKQorCQkJZ290byBvdXRfZXJyOworCX0KKworCXJldHVybiBtc2c7CisKK291dF9lcnI6CisJ
a3ZtaV9tc2dfZnJlZShtc2cpOworb3V0OgorCXJldHVybiBOVUxMOworfQorCitzdGF0aWMgaW50
IGt2bWlfbXNnX2RvX3ZtX2NtZChzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksCisJCQkg
ICAgICBjb25zdCBzdHJ1Y3Qga3ZtaV9tc2dfaGRyICptc2cpCit7CisJa3ZtaV92bV9tc2dfZmN0
IGZjdCA9IGdldF92bV9tc2dfaGFuZGxlcihtc2ctPmlkKTsKKworCXJldHVybiBmY3Qoa3ZtaSwg
bXNnLCBtc2cgKyAxKTsKK30KKworc3RhdGljIGludCBrdm1pX21zZ192bV9yZXBseV9lYyhzdHJ1
Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksCisJCQkJY29uc3Qgc3RydWN0IGt2bWlfbXNnX2hk
ciAqbXNnLCBpbnQgZWMpCit7CisJcmV0dXJuIGt2bWlfbXNnX3ZtX3JlcGx5KGt2bWksIG1zZywg
ZWMsIE5VTEwsIDApOworfQorCitzdGF0aWMgaW50IGt2bWlfbXNnX2hhbmRsZV92bV9jbWQoc3Ry
dWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pLAorCQkJCSAgc3RydWN0IGt2bWlfbXNnX2hkciAq
bXNnKQoreworCWlmICgha3ZtaV9pc19jb21tYW5kX2FsbG93ZWQoa3ZtaSwgbXNnLT5pZCkpCisJ
CXJldHVybiBrdm1pX21zZ192bV9yZXBseV9lYyhrdm1pLCBtc2csIC1LVk1fRVBFUk0pOworCisJ
cmV0dXJuIGt2bWlfbXNnX2RvX3ZtX2NtZChrdm1pLCBtc2cpOworfQorCiBib29sIGt2bWlfbXNn
X3Byb2Nlc3Moc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pKQogewotCXJldHVybiBmYWxz
ZTsKKwlzdHJ1Y3Qga3ZtaV9tc2dfaGRyICptc2c7CisJaW50IGVyciA9IC0xOworCisJbXNnID0g
a3ZtaV9tc2dfcmVjdihrdm1pKTsKKwlpZiAoIW1zZykKKwkJZ290byBvdXQ7CisKKwlpZiAoaXNf
dm1fY29tbWFuZChtc2ctPmlkKSkKKwkJZXJyID0ga3ZtaV9tc2dfaGFuZGxlX3ZtX2NtZChrdm1p
LCBtc2cpOworCWVsc2UKKwkJZXJyID0ga3ZtaV9tc2dfdm1fcmVwbHlfZWMoa3ZtaSwgbXNnLCAt
S1ZNX0VOT1NZUyk7CisKKwlrdm1pX21zZ19mcmVlKG1zZyk7CitvdXQ6CisJcmV0dXJuIGVyciA9
PSAwOwogfQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
