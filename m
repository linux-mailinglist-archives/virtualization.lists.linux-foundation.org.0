Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8562C228B1B
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:25:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 334568825E;
	Tue, 21 Jul 2020 21:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wiG1mgKL0pqF; Tue, 21 Jul 2020 21:25:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 31EC488267;
	Tue, 21 Jul 2020 21:25:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22D8DC016F;
	Tue, 21 Jul 2020 21:25:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1D98C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9C8E685A5B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uqY+KCbhSMtD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AF1A8881E8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:52 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 60EB0305D76B; Wed, 22 Jul 2020 00:09:22 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 4597F304FA14;
 Wed, 22 Jul 2020 00:09:22 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 22/84] KVM: x86: save the error code during EPT/NPF exits
 handling
Date: Wed, 22 Jul 2020 00:08:20 +0300
Message-Id: <20200721210922.7646-23-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
 virtualization@lists.linux-foundation.org
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBpcyBuZWVk
ZWQgZm9yIGt2bV9wYWdlX3RyYWNrX2VtdWxhdGlvbl9mYWlsdXJlKCkuCgpXaGVuIHRoZSBpbnRy
b3NwZWN0aW9uIHRvb2wge3JlYWQsd3JpdGUsZXhlY30tcHJvdGVjdCBhIGd1ZXN0IG1lbW9yeQpw
YWdlLCBpdCBpcyBub3RpZmllZCBmcm9tIHRoZSByZWFkL3dyaXRlL2ZldGNoIGNhbGxiYWNrcyB1
c2VkIGJ5CnRoZSBLVk0gZW11bGF0b3IuIElmIHRoZSBlbXVsYXRpb24gZmFpbHMgaXQgaXMgcG9z
c2libGUgdGhhdCB0aGUKcmVhZC93cml0ZSBjYWxsYmFja3Mgd2VyZSBub3QgdXNlZC4gSW4gc3Vj
aCBjYXNlcywgdGhlIGVtdWxhdG9yIHdpbGwKY2FsbCBrdm1fcGFnZV90cmFja19lbXVsYXRpb25f
ZmFpbHVyZSgpIHRvIGVuc3VyZSB0aGF0IHRoZSBpbnRyb3NwZWN0aW9uCnRvb2wgaXMgbm90aWZp
ZWQgb2YgdGhlIHJlYWQvd3JpdGUgI1BGIChiYXNlZCBvbiB0aGlzIHNhdmVkIGVycm9yIGNvZGUp
LAp3aGljaCBpbiB0dXJuIGNhbiBlbXVsYXRlIHRoZSBpbnN0cnVjdGlvbiBvciB1bnByb3RlY3Qg
dGhlIG1lbW9yeSBwYWdlCihhbmQgbGV0IHRoZSBndWVzdCBleGVjdXRlIHRoZSBpbnN0cnVjdGlv
bikuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBEb27Im3UgPG1kb250dUBiaXRkZWZlbmRlci5jb20+
ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4K
LS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgMyArKysKIGFyY2gveDg2L2t2
bS9zdm0vc3ZtLmMgICAgICAgICAgfCAyICsrCiBhcmNoL3g4Ni9rdm0vdm14L3ZteC5jICAgICAg
ICAgIHwgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9r
dm1faG9zdC5oCmluZGV4IGYwNGEwMWRhYzQyMy4uMjUzMGFmNDQyMGNmIDEwMDY0NAotLS0gYS9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNt
L2t2bV9ob3N0LmgKQEAgLTgzNyw2ICs4MzcsOSBAQCBzdHJ1Y3Qga3ZtX3ZjcHVfYXJjaCB7CiAK
IAkvKiBBTUQgTVNSQzAwMV8wMDE1IEhhcmR3YXJlIENvbmZpZ3VyYXRpb24gKi8KIAl1NjQgbXNy
X2h3Y3I7CisKKwkvKiAjUEYgdHJhbnNsYXRlZCBlcnJvciBjb2RlIGZyb20gRVBUL05QVCBleGl0
IHJlYXNvbiAqLworCXU2NCBlcnJvcl9jb2RlOwogfTsKIAogc3RydWN0IGt2bV9scGFnZV9pbmZv
IHsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMgYi9hcmNoL3g4Ni9rdm0vc3Zt
L3N2bS5jCmluZGV4IDljOGU3NzE5M2Y5OC4uMWVjODhmZjI0MWFiIDEwMDY0NAotLS0gYS9hcmNo
L3g4Ni9rdm0vc3ZtL3N2bS5jCisrKyBiL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMKQEAgLTE3OTks
NiArMTc5OSw4IEBAIHN0YXRpYyBpbnQgbnBmX2ludGVyY2VwdGlvbihzdHJ1Y3QgdmNwdV9zdm0g
KnN2bSkKIAl1NjQgZmF1bHRfYWRkcmVzcyA9IF9fc21lX2Nscihzdm0tPnZtY2ItPmNvbnRyb2wu
ZXhpdF9pbmZvXzIpOwogCXU2NCBlcnJvcl9jb2RlID0gc3ZtLT52bWNiLT5jb250cm9sLmV4aXRf
aW5mb18xOwogCisJc3ZtLT52Y3B1LmFyY2guZXJyb3JfY29kZSA9IGVycm9yX2NvZGU7CisKIAl0
cmFjZV9rdm1fcGFnZV9mYXVsdChmYXVsdF9hZGRyZXNzLCBlcnJvcl9jb2RlKTsKIAlyZXR1cm4g
a3ZtX21tdV9wYWdlX2ZhdWx0KCZzdm0tPnZjcHUsIGZhdWx0X2FkZHJlc3MsIGVycm9yX2NvZGUs
CiAJCQlzdGF0aWNfY3B1X2hhcyhYODZfRkVBVFVSRV9ERUNPREVBU1NJU1RTKSA/CmRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwppbmRl
eCBjZDQ5OGVjZThiNTIuLjY1NTRjMjI3ODE3NiAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3Zt
eC92bXguYworKysgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCkBAIC01MzY1LDYgKzUzNjUsNyBA
QCBzdGF0aWMgaW50IGhhbmRsZV9lcHRfdmlvbGF0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
IAkJICAgICAgPyBQRkVSUl9HVUVTVF9GSU5BTF9NQVNLIDogUEZFUlJfR1VFU1RfUEFHRV9NQVNL
OwogCiAJdmNwdS0+YXJjaC5leGl0X3F1YWxpZmljYXRpb24gPSBleGl0X3F1YWxpZmljYXRpb247
CisJdmNwdS0+YXJjaC5lcnJvcl9jb2RlID0gZXJyb3JfY29kZTsKIAlyZXR1cm4ga3ZtX21tdV9w
YWdlX2ZhdWx0KHZjcHUsIGdwYSwgZXJyb3JfY29kZSwgTlVMTCwgMCk7CiB9CiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
