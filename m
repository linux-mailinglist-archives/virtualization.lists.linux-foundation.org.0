Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E5D229C8F
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:01:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DE2BF887AC;
	Wed, 22 Jul 2020 16:01:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0jkQ1EhN6MXx; Wed, 22 Jul 2020 16:01:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5503D887C8;
	Wed, 22 Jul 2020 16:01:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24E1DC004C;
	Wed, 22 Jul 2020 16:01:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA11FC004E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 91A1E88253
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SRoRjf05MWVt
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C07D288424
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 360CB305D678; Wed, 22 Jul 2020 19:01:33 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 2AB37305FFA1;
 Wed, 22 Jul 2020 19:01:33 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 31/34] KVM: introspection: add #VE host capability
 checker
Date: Wed, 22 Jul 2020 19:01:18 +0300
Message-Id: <20200722160121.9601-32-alazar@bitdefender.com>
In-Reply-To: <20200722160121.9601-1-alazar@bitdefender.com>
References: <20200722160121.9601-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?=C8=98tefan=20=C8=98icleru?= <ssicleru@bitdefender.com>,
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

RnJvbTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgoKQWRkIG9u
ZSBtb3JlIGZpZWxkIHRvIHN0cnVjdCBrdm1pX2ZlYXR1cmVzIGluIG9yZGVyIHRvIHB1Ymxpc2gg
I1ZFCmNhcGFiaWxpdGllcyBvbiB0aGUgaG9zdCBhcyBpbmRpY2F0ZWQgYnkga3ZtX3ZlX3N1cHBv
cnRlZCBmbGFnLgoKU2lnbmVkLW9mZi1ieTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0
ZGVmZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRk
ZWZlbmRlci5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdCAgICAgICAg
ICAgICAgICB8IDUgKysrLS0KIGFyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5oICAgICAg
ICAgICAgICAgfCAzICsrLQogYXJjaC94ODYva3ZtL2t2bWkuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDEgKwogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rl
c3QuYyB8IDEgKwogNCBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdCBiL0RvY3Vt
ZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKaW5kZXggNjU4YzlkZjAxNDY5Li5jYWE1MWZjY2M0
NjMgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKKysrIGIvRG9j
dW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdApAQCAtMjY1LDExICsyNjUsMTIgQEAgRm9yIHg4
NgogCQlfX3U4IHNpbmdsZXN0ZXA7CiAJCV9fdTggdm1mdW5jOwogCQlfX3U4IGVwdHA7Ci0JCV9f
dTggcGFkZGluZ1s1XTsKKwkJX191OCB2ZTsKKwkJX191OCBwYWRkaW5nWzRdOwogCX07CiAKIFJl
dHVybnMgdGhlIGludHJvc3BlY3Rpb24gQVBJIHZlcnNpb24gYW5kIHNvbWUgb2YgdGhlIGZlYXR1
cmVzIHN1cHBvcnRlZAotYnkgdGhlIGhhcmR3YXJlIChlZy4gYWx0ZXJuYXRlIEVQVCB2aWV3cyku
CitieSB0aGUgaGFyZHdhcmUgKGVnLiBhbHRlcm5hdGUgRVBUIHZpZXdzLCB2aXJ0dWFsaXphdGlv
biBleGNlcHRpb24pLgogCiBUaGlzIGNvbW1hbmQgaXMgYWx3YXlzIGFsbG93ZWQgYW5kIHN1Y2Nl
c3NmdWwuCiAKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5oIGIv
YXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9rdm1pLmgKaW5kZXggZmMzNWRhOTAwNzc4Li41Njk5
MmRhY2ZiNjkgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5oCisr
KyBiL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5oCkBAIC0xNTEsNyArMTUxLDggQEAg
c3RydWN0IGt2bWlfZmVhdHVyZXMgewogCV9fdTggc2luZ2xlc3RlcDsKIAlfX3U4IHZtZnVuYzsK
IAlfX3U4IGVwdHA7Ci0JX191OCBwYWRkaW5nWzVdOworCV9fdTggdmU7CisJX191OCBwYWRkaW5n
WzRdOwogfTsKIAogc3RydWN0IGt2bWlfdmNwdV9nZXRfZXB0X3ZpZXdfcmVwbHkgewpkaWZmIC0t
Z2l0IGEvYXJjaC94ODYva3ZtL2t2bWkuYyBiL2FyY2gveDg2L2t2bS9rdm1pLmMKaW5kZXggMjdm
ZDczMmNmZjI5Li4zZThjODM2MjM3MDMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9rdm1pLmMK
KysrIGIvYXJjaC94ODYva3ZtL2t2bWkuYwpAQCAtMTM4Myw2ICsxMzgzLDcgQEAgdm9pZCBrdm1p
X2FyY2hfZmVhdHVyZXMoc3RydWN0IGt2bWlfZmVhdHVyZXMgKmZlYXQpCiAJCQlrdm1feDg2X29w
cy5nZXRfdm1mdW5jX3N0YXR1cygpOwogCWZlYXQtPmVwdHAgPSBrdm1feDg2X29wcy5nZXRfZXB0
cF9zd2l0Y2hpbmdfc3RhdHVzICYmCiAJCQlrdm1feDg2X29wcy5nZXRfZXB0cF9zd2l0Y2hpbmdf
c3RhdHVzKCk7CisJZmVhdC0+dmUgPSBrdm1fdmVfc3VwcG9ydGVkOwogfQogCiBib29sIGt2bWlf
YXJjaF9zdGFydF9zaW5nbGVzdGVwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKZGlmZiAtLWdpdCBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMgYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jCmluZGV4IGQ4MDhjYjYxNDYz
ZC4uNGUwOTljYmZjZjRlIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0v
eDg2XzY0L2t2bWlfdGVzdC5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZf
NjQva3ZtaV90ZXN0LmMKQEAgLTQ1OSw2ICs0NTksNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2NtZF9n
ZXRfdmVyc2lvbih2b2lkKQogCXByX2luZm8oIlx0c2luZ2xlc3RlcDogJXVcbiIsIGZlYXR1cmVz
LnNpbmdsZXN0ZXApOwogCXByX2luZm8oIlx0dm1mdW5jOiAldVxuIiwgZmVhdHVyZXMudm1mdW5j
KTsKIAlwcl9pbmZvKCJcdGVwdHA6ICV1XG4iLCBmZWF0dXJlcy5lcHRwKTsKKwlwcl9pbmZvKCJc
dHZlOiAldVxuIiwgZmVhdHVyZXMudmUpOwogfQogCiBzdGF0aWMgdm9pZCBjbWRfdm1fY2hlY2tf
Y29tbWFuZChfX3UxNiBpZCwgX191MTYgcGFkZGluZywgaW50IGV4cGVjdGVkX2VycikKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxp
emF0aW9u
