Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DE38E228B39
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:26:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 94287884D2;
	Tue, 21 Jul 2020 21:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wD0Os1Hb2zPJ; Tue, 21 Jul 2020 21:26:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C8C16884D7;
	Tue, 21 Jul 2020 21:26:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AACB3C016F;
	Tue, 21 Jul 2020 21:26:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBF2DC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C6B5D85A5B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5mvgBZdouk+8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 00E5F882C0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:58 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 4D1DA305D4F8; Wed, 22 Jul 2020 00:09:29 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 24D1C304FA12;
 Wed, 22 Jul 2020 00:09:29 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 64/84] KVM: introspection: add KVMI_VCPU_CONTROL_CR and
 KVMI_EVENT_CR
Date: Wed, 22 Jul 2020 00:09:02 +0300
Message-Id: <20200721210922.7646-65-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVXNpbmcgdGhlIEtW
TUlfVkNQVV9DT05UUk9MX0NSIGNvbW1hbmQsIHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgc3Vic2Ny
aWJlcwp0byBLVk1JX0VWRU5UX0NSIGV2ZW50cyB0aGF0IHdpbGwgYmUgc2VudCB3aGVuIGEgY29u
dHJvbCByZWdpc3RlciAoQ1IwLApDUjMgb3IgQ1I0KSBpcyBnb2luZyB0byBiZSBjaGFuZ2VkLgoK
U2lnbmVkLW9mZi1ieTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgpDby1k
ZXZlbG9wZWQtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KU2ln
bmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0K
IERvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QgICAgICAgICAgICAgICB8ICA3MCArKysr
KysrKysrKwogYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtaV9ob3N0LmggICAgICAgICAgICAgIHwg
IDExICsrCiBhcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2t2bWkuaCAgICAgICAgICAgICAgfCAg
MTggKysrCiBhcmNoL3g4Ni9rdm0va3ZtaS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAx
MTEgKysrKysrKysrKysrKysrKysrCiBhcmNoL3g4Ni9rdm0vdm14L3ZteC5jICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDYgKy0KIGFyY2gveDg2L2t2bS94ODYuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAxMiArLQogaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaCAgICAgICAgICAg
ICAgICAgICAgIHwgICAzICsKIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlf
dGVzdC5jICB8IDEwOCArKysrKysrKysrKysrKysrKwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9r
dm1pLmMgICAgICAgICAgICAgICAgIHwgICAxICsKIHZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3Zt
aV9pbnQuaCAgICAgICAgICAgICB8ICAgNyArKwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1p
X21zZy5jICAgICAgICAgICAgIHwgIDE4ICsrLQogMTEgZmlsZXMgY2hhbmdlZCwgMzU5IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi92aXJ0
L2t2bS9rdm1pLnJzdCBiL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKaW5kZXggZjc2
MDk1N2IyN2Y0Li5lMWY5NzhmYzc5OWIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdmlydC9r
dm0va3ZtaS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdApAQCAtNTUw
LDYgKzU1MCw3IEBAIEVuYWJsZXMvZGlzYWJsZXMgdkNQVSBpbnRyb3NwZWN0aW9uIGV2ZW50cy4g
VGhpcyBjb21tYW5kIGNhbiBiZSB1c2VkIHdpdGgKIHRoZSBmb2xsb3dpbmcgZXZlbnRzOjoKIAog
CUtWTUlfRVZFTlRfQlJFQUtQT0lOVAorCUtWTUlfRVZFTlRfQ1IKIAlLVk1JX0VWRU5UX0hZUEVS
Q0FMTAogCiBXaGVuIGFuIGV2ZW50IGlzIGVuYWJsZWQsIHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wg
aXMgbm90aWZpZWQgYW5kCkBAIC03MTQsNiArNzE1LDQwIEBAIGludGVyY2VwdGlvbnMpLiBCeSBk
ZWZhdWx0IGl0IGlzIGRpc2FibGVkLgogKiAtS1ZNX0VJTlZBTCAtIHRoZSBwYWRkaW5nIGlzIG5v
dCB6ZXJvCiAqIC1LVk1fRUlOVkFMIC0gJ2VuYWJsZWQnIGlzIG5vdCAxIG9yIDAKIAorMTUuIEtW
TUlfVkNQVV9DT05UUk9MX0NSCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKworOkFyY2hpdGVj
dHVyZXM6IHg4NgorOlZlcnNpb25zOiA+PSAxCis6UGFyYW1ldGVyczoKKworOjoKKworCXN0cnVj
dCBrdm1pX3ZjcHVfaGRyOworCXN0cnVjdCBrdm1pX3ZjcHVfY29udHJvbF9jciB7CisJCV9fdTgg
Y3I7CisJCV9fdTggZW5hYmxlOworCQlfX3UxNiBwYWRkaW5nMTsKKwkJX191MzIgcGFkZGluZzI7
CisJfTsKKworOlJldHVybnM6CisKKzo6CisKKwlzdHJ1Y3Qga3ZtaV9lcnJvcl9jb2RlCisKK0Vu
YWJsZXMvZGlzYWJsZXMgaW50cm9zcGVjdGlvbiBmb3IgYSBzcGVjaWZpYyBjb250cm9sIHJlZ2lz
dGVyIGFuZCBtdXN0CitiZSB1c2VkIGluIGFkZGl0aW9uIHRvICpLVk1JX1ZDUFVfQ09OVFJPTF9F
VkVOVFMqIHdpdGggdGhlICpLVk1JX0VWRU5UX0NSKgorSUQgc2V0LgorCis6RXJyb3JzOgorCisq
IC1LVk1fRUlOVkFMIC0gdGhlIHNlbGVjdGVkIHZDUFUgaXMgaW52YWxpZAorKiAtS1ZNX0VJTlZB
TCAtIHRoZSBzcGVjaWZpZWQgY29udHJvbCByZWdpc3RlciBpcyBub3QgQ1IwLCBDUjMgb3IgQ1I0
CisqIC1LVk1fRUlOVkFMIC0gdGhlIHBhZGRpbmcgaXMgbm90IHplcm8KKyogLUtWTV9FQUdBSU4g
LSB0aGUgc2VsZWN0ZWQgdkNQVSBjYW4ndCBiZSBpbnRyb3NwZWN0ZWQgeWV0CisKIEV2ZW50cwog
PT09PT09CiAKQEAgLTg5MCwzICs5MjUsMzggQEAgdHJ5aW5nIHRvIHBlcmZvcm0gYSBjZXJ0YWlu
IG9wZXJhdGlvbiAobGlrZSBjcmVhdGluZyBhIHByb2Nlc3MpLgogYGBrdm1pX2V2ZW50YGAgYW5k
IHRoZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzIGFyZSBzZW50IHRvIHRoZSBpbnRyb3NwZWN0aW9u
IHRvb2wuCiAKIFRoZSAqUkVUUlkqIGFjdGlvbiBpcyB1c2VkIGJ5IHRoZSBpbnRyb3NwZWN0aW9u
IHRvb2wgZm9yIGl0cyBvd24gYnJlYWtwb2ludHMuCisKKzUuIEtWTUlfRVZFTlRfQ1IKKy0tLS0t
LS0tLS0tLS0tLS0KKworOkFyY2hpdGVjdHVyZXM6IHg4NgorOlZlcnNpb25zOiA+PSAxCis6QWN0
aW9uczogQ09OVElOVUUsIENSQVNICis6UGFyYW1ldGVyczoKKworOjoKKworCXN0cnVjdCBrdm1p
X2V2ZW50OworCXN0cnVjdCBrdm1pX2V2ZW50X2NyIHsKKwkJX191OCBjcjsKKwkJX191OCBwYWRk
aW5nWzddOworCQlfX3U2NCBvbGRfdmFsdWU7CisJCV9fdTY0IG5ld192YWx1ZTsKKwl9OworCis6
UmV0dXJuczoKKworOjoKKworCXN0cnVjdCBrdm1pX3ZjcHVfaGRyOworCXN0cnVjdCBrdm1pX2V2
ZW50X3JlcGx5OworCXN0cnVjdCBrdm1pX2V2ZW50X2NyX3JlcGx5IHsKKwkJX191NjQgbmV3X3Zh
bDsKKwl9OworCitUaGlzIGV2ZW50IGlzIHNlbnQgd2hlbiBhIGNvbnRyb2wgcmVnaXN0ZXIgaXMg
Z29pbmcgdG8gYmUgY2hhbmdlZCBhbmQgdGhlCitpbnRyb3NwZWN0aW9uIGhhcyBiZWVuIGVuYWJs
ZWQgZm9yIHRoaXMgZXZlbnQgYW5kIGZvciB0aGlzIHNwZWNpZmljCityZWdpc3RlciAoc2VlICoq
S1ZNSV9WQ1BVX0NPTlRST0xfRVZFTlRTKiopLgorCitgYGt2bWlfZXZlbnRgYCwgdGhlIGNvbnRy
b2wgcmVnaXN0ZXIgbnVtYmVyLCB0aGUgb2xkIHZhbHVlIGFuZCB0aGUgbmV3IHZhbHVlCithcmUg
c2VudCB0byB0aGUgaW50cm9zcGVjdGlvbiB0b29sLiBUaGUgKkNPTlRJTlVFKiBhY3Rpb24gd2ls
bCBzZXQgdGhlIGBgbmV3X3ZhbGBgLgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20v
a3ZtaV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1pX2hvc3QuaAppbmRleCAzZTg1
YWU0ZmU1ZjAuLjFhZmY5MWVmODQ3NSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20v
a3ZtaV9ob3N0LmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtaV9ob3N0LmgKQEAgLTQs
NiArNCw4IEBACiAKICNpbmNsdWRlIDxhc20va3ZtaS5oPgogCisjZGVmaW5lIEtWTUlfTlVNX0NS
IDUKKwogc3RydWN0IGt2bWlfbW9uaXRvcl9pbnRlcmNlcHRpb24gewogCWJvb2wga3ZtaV9pbnRl
cmNlcHRlZDsKIAlib29sIGt2bV9pbnRlcmNlcHRlZDsKQEAgLTE3LDYgKzE5LDcgQEAgc3RydWN0
IGt2bWlfaW50ZXJjZXB0aW9uIHsKIH07CiAKIHN0cnVjdCBrdm1fdmNwdV9hcmNoX2ludHJvc3Bl
Y3Rpb24geworCURFQ0xBUkVfQklUTUFQKGNyX21hc2ssIEtWTUlfTlVNX0NSKTsKIH07CiAKIHN0
cnVjdCBrdm1fYXJjaF9pbnRyb3NwZWN0aW9uIHsKQEAgLTI1LDExICsyOCwxOSBAQCBzdHJ1Y3Qg
a3ZtX2FyY2hfaW50cm9zcGVjdGlvbiB7CiAjaWZkZWYgQ09ORklHX0tWTV9JTlRST1NQRUNUSU9O
CiAKIGJvb2wga3ZtaV9tb25pdG9yX2JwX2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
IHUzMiBkYmcpOworYm9vbCBrdm1pX2NyX2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5z
aWduZWQgaW50IGNyLAorCQkgICB1bnNpZ25lZCBsb25nIG9sZF92YWx1ZSwgdW5zaWduZWQgbG9u
ZyAqbmV3X3ZhbHVlKTsKK2Jvb2wga3ZtaV9jcjNfaW50ZXJjZXB0ZWQoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KTsKIAogI2Vsc2UgLyogQ09ORklHX0tWTV9JTlRST1NQRUNUSU9OICovCiAKIHN0YXRp
YyBpbmxpbmUgYm9vbCBrdm1pX21vbml0b3JfYnBfaW50ZXJjZXB0KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwgdTMyIGRiZykKIAl7IHJldHVybiBmYWxzZTsgfQorc3RhdGljIGlubGluZSBib29sIGt2
bWlfY3JfZXZlbnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBpbnQgY3IsCisJCQkJ
IHVuc2lnbmVkIGxvbmcgb2xkX3ZhbHVlLAorCQkJCSB1bnNpZ25lZCBsb25nICpuZXdfdmFsdWUp
CisJCQl7IHJldHVybiB0cnVlOyB9CitzdGF0aWMgaW5saW5lIGJvb2wga3ZtaV9jcjNfaW50ZXJj
ZXB0ZWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KSB7IHJldHVybiBmYWxzZTsgfQogCiAjZW5kaWYg
LyogQ09ORklHX0tWTV9JTlRST1NQRUNUSU9OICovCiAKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2lu
Y2x1ZGUvdWFwaS9hc20va3ZtaS5oIGIvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9rdm1pLmgK
aW5kZXggMTYwNTc3NzI1NmEzLi40YzU5YzlmZTZiMDAgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2lu
Y2x1ZGUvdWFwaS9hc20va3ZtaS5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3Zt
aS5oCkBAIC02NSw0ICs2NSwyMiBAQCBzdHJ1Y3Qga3ZtaV9ldmVudF9icmVha3BvaW50IHsKIAlf
X3U4IHBhZGRpbmdbN107CiB9OwogCitzdHJ1Y3Qga3ZtaV92Y3B1X2NvbnRyb2xfY3IgeworCV9f
dTggY3I7CisJX191OCBlbmFibGU7CisJX191MTYgcGFkZGluZzE7CisJX191MzIgcGFkZGluZzI7
Cit9OworCitzdHJ1Y3Qga3ZtaV9ldmVudF9jciB7CisJX191OCBjcjsKKwlfX3U4IHBhZGRpbmdb
N107CisJX191NjQgb2xkX3ZhbHVlOworCV9fdTY0IG5ld192YWx1ZTsKK307CisKK3N0cnVjdCBr
dm1pX2V2ZW50X2NyX3JlcGx5IHsKKwlfX3U2NCBuZXdfdmFsOworfTsKKwogI2VuZGlmIC8qIF9V
QVBJX0FTTV9YODZfS1ZNSV9IICovCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0va3ZtaS5jIGIv
YXJjaC94ODYva3ZtL2t2bWkuYwppbmRleCA4OWZhMTU4YTY1MzUuLmU3MmIyZWY1YjI4YSAxMDA2
NDQKLS0tIGEvYXJjaC94ODYva3ZtL2t2bWkuYworKysgYi9hcmNoL3g4Ni9rdm0va3ZtaS5jCkBA
IC00MDAsMyArNDAwLDExNCBAQCB2b2lkIGt2bWlfYXJjaF9yZXF1ZXN0X2ludGVyY2VwdGlvbl9j
bGVhbnVwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAkJYXJjaF92Y3B1aS0+Y2xlYW51cCA9IHRy
dWU7CiAJfQogfQorCitpbnQga3ZtaV9hcmNoX2NtZF92Y3B1X2NvbnRyb2xfY3Ioc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LAorCQkJCSAgY29uc3Qgc3RydWN0IGt2bWlfdmNwdV9jb250cm9sX2NyICpy
ZXEpCit7CisJdTMyIGNyID0gcmVxLT5jcjsKKworCWlmIChyZXEtPnBhZGRpbmcxIHx8IHJlcS0+
cGFkZGluZzIgfHwgcmVxLT5lbmFibGUgPiAxKQorCQlyZXR1cm4gLUtWTV9FSU5WQUw7CisKKwlz
d2l0Y2ggKGNyKSB7CisJY2FzZSAwOgorCQlicmVhazsKKwljYXNlIDM6CisJCWt2bV94ODZfb3Bz
LmNvbnRyb2xfY3IzX2ludGVyY2VwdCh2Y3B1LCBDUl9UWVBFX1csCisJCQkJCQkgIHJlcS0+ZW5h
YmxlID09IDEpOworCQlicmVhazsKKwljYXNlIDQ6CisJCWJyZWFrOworCWRlZmF1bHQ6CisJCXJl
dHVybiAtS1ZNX0VJTlZBTDsKKwl9CisKKwlpZiAocmVxLT5lbmFibGUpCisJCXNldF9iaXQoY3Is
IFZDUFVJKHZjcHUpLT5hcmNoLmNyX21hc2spOworCWVsc2UKKwkJY2xlYXJfYml0KGNyLCBWQ1BV
SSh2Y3B1KS0+YXJjaC5jcl9tYXNrKTsKKworCXJldHVybiAwOworfQorCitzdGF0aWMgdTMyIGt2
bWlfc2VuZF9jcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHUzMiBjciwgdTY0IG9sZF92YWx1ZSwK
KwkJCXU2NCBuZXdfdmFsdWUsIHU2NCAqcmV0X3ZhbHVlKQoreworCXN0cnVjdCBrdm1pX2V2ZW50
X2NyIGU7CisJc3RydWN0IGt2bWlfZXZlbnRfY3JfcmVwbHkgcjsKKwlpbnQgZXJyLCBhY3Rpb247
CisKKwltZW1zZXQoJmUsIDAsIHNpemVvZihlKSk7CisJZS5jciA9IGNyOworCWUub2xkX3ZhbHVl
ID0gb2xkX3ZhbHVlOworCWUubmV3X3ZhbHVlID0gbmV3X3ZhbHVlOworCisJZXJyID0ga3ZtaV9z
ZW5kX2V2ZW50KHZjcHUsIEtWTUlfRVZFTlRfQ1IsICZlLCBzaXplb2YoZSksCisJCQkgICAgICAm
ciwgc2l6ZW9mKHIpLCAmYWN0aW9uKTsKKwlpZiAoZXJyKQorCQlyZXR1cm4gS1ZNSV9FVkVOVF9B
Q1RJT05fQ09OVElOVUU7CisKKwkqcmV0X3ZhbHVlID0gci5uZXdfdmFsOworCXJldHVybiBhY3Rp
b247Cit9CisKK3N0YXRpYyBib29sIF9fa3ZtaV9jcl9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIHVuc2lnbmVkIGludCBjciwKKwkJCSAgICB1NjQgb2xkX3ZhbHVlLCB1bnNpZ25lZCBsb25n
ICpuZXdfdmFsdWUpCit7CisJdTY0IHJldF92YWx1ZSA9ICpuZXdfdmFsdWU7CisJYm9vbCByZXQg
PSBmYWxzZTsKKwl1MzIgYWN0aW9uOworCisJaWYgKCF0ZXN0X2JpdChjciwgVkNQVUkodmNwdSkt
PmFyY2guY3JfbWFzaykpCisJCXJldHVybiB0cnVlOworCisJYWN0aW9uID0ga3ZtaV9zZW5kX2Ny
KHZjcHUsIGNyLCBvbGRfdmFsdWUsICpuZXdfdmFsdWUsICZyZXRfdmFsdWUpOworCXN3aXRjaCAo
YWN0aW9uKSB7CisJY2FzZSBLVk1JX0VWRU5UX0FDVElPTl9DT05USU5VRToKKwkJKm5ld192YWx1
ZSA9IHJldF92YWx1ZTsKKwkJcmV0ID0gdHJ1ZTsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJa3Zt
aV9oYW5kbGVfY29tbW9uX2V2ZW50X2FjdGlvbnModmNwdS0+a3ZtLCBhY3Rpb24pOworCX0KKwor
CXJldHVybiByZXQ7Cit9CisKK2Jvb2wga3ZtaV9jcl9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIHVuc2lnbmVkIGludCBjciwKKwkJICAgdW5zaWduZWQgbG9uZyBvbGRfdmFsdWUsIHVuc2ln
bmVkIGxvbmcgKm5ld192YWx1ZSkKK3sKKwlzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWk7
CisJYm9vbCByZXQgPSB0cnVlOworCisJaWYgKG9sZF92YWx1ZSA9PSAqbmV3X3ZhbHVlKQorCQly
ZXR1cm4gdHJ1ZTsKKworCWt2bWkgPSBrdm1pX2dldCh2Y3B1LT5rdm0pOworCWlmICgha3ZtaSkK
KwkJcmV0dXJuIHRydWU7CisKKwlpZiAoaXNfZXZlbnRfZW5hYmxlZCh2Y3B1LCBLVk1JX0VWRU5U
X0NSKSkKKwkJcmV0ID0gX19rdm1pX2NyX2V2ZW50KHZjcHUsIGNyLCBvbGRfdmFsdWUsIG5ld192
YWx1ZSk7CisKKwlrdm1pX3B1dCh2Y3B1LT5rdm0pOworCisJcmV0dXJuIHJldDsKK30KKworYm9v
bCBrdm1pX2NyM19pbnRlcmNlcHRlZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJc3RydWN0
IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pOworCWJvb2wgcmV0OworCisJa3ZtaSA9IGt2bWlfZ2V0
KHZjcHUtPmt2bSk7CisJaWYgKCFrdm1pKQorCQlyZXR1cm4gZmFsc2U7CisKKwlyZXQgPSB0ZXN0
X2JpdCgzLCBWQ1BVSSh2Y3B1KS0+YXJjaC5jcl9tYXNrKTsKKworCWt2bWlfcHV0KHZjcHUtPmt2
bSk7CisKKwlyZXR1cm4gcmV0OworfQorRVhQT1JUX1NZTUJPTChrdm1pX2NyM19pbnRlcmNlcHRl
ZCk7CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jIGIvYXJjaC94ODYva3ZtL3Zt
eC92bXguYwppbmRleCA5ZTFiZWE3NGI3NGMuLjVkMDg3NjQyMGRkOSAxMDA2NDQKLS0tIGEvYXJj
aC94ODYva3ZtL3ZteC92bXguYworKysgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCkBAIC01MDM4
LDcgKzUwMzgsOCBAQCBzdGF0aWMgaW50IGhhbmRsZV9jcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
CiAJCQllcnIgPSBoYW5kbGVfc2V0X2NyMCh2Y3B1LCB2YWwpOwogCQkJcmV0dXJuIGt2bV9jb21w
bGV0ZV9pbnNuX2dwKHZjcHUsIGVycik7CiAJCWNhc2UgMzoKLQkJCVdBUk5fT05fT05DRShlbmFi
bGVfdW5yZXN0cmljdGVkX2d1ZXN0KTsKKwkJCVdBUk5fT05fT05DRShlbmFibGVfdW5yZXN0cmlj
dGVkX2d1ZXN0ICYmCisJCQkJICAgICAha3ZtaV9jcjNfaW50ZXJjZXB0ZWQodmNwdSkpOwogCQkJ
ZXJyID0ga3ZtX3NldF9jcjModmNwdSwgdmFsKTsKIAkJCXJldHVybiBrdm1fY29tcGxldGVfaW5z
bl9ncCh2Y3B1LCBlcnIpOwogCQljYXNlIDQ6CkBAIC01MDcxLDcgKzUwNzIsOCBAQCBzdGF0aWMg
aW50IGhhbmRsZV9jcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJY2FzZSAxOiAvKm1vdiBmcm9t
IGNyKi8KIAkJc3dpdGNoIChjcikgewogCQljYXNlIDM6Ci0JCQlXQVJOX09OX09OQ0UoZW5hYmxl
X3VucmVzdHJpY3RlZF9ndWVzdCk7CisJCQlXQVJOX09OX09OQ0UoZW5hYmxlX3VucmVzdHJpY3Rl
ZF9ndWVzdCAmJgorCQkJCSAgICAgIWt2bWlfY3IzX2ludGVyY2VwdGVkKHZjcHUpKTsKIAkJCXZh
bCA9IGt2bV9yZWFkX2NyMyh2Y3B1KTsKIAkJCWt2bV9yZWdpc3Rlcl93cml0ZSh2Y3B1LCByZWcs
IHZhbCk7CiAJCQl0cmFjZV9rdm1fY3JfcmVhZChjciwgdmFsKTsKZGlmZiAtLWdpdCBhL2FyY2gv
eDg2L2t2bS94ODYuYyBiL2FyY2gveDg2L2t2bS94ODYuYwppbmRleCA5YzhiN2EzYzU3NTguLmEx
MmFhOGUxMjVkMyAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5jCisrKyBiL2FyY2gveDg2
L2t2bS94ODYuYwpAQCAtODEzLDYgKzgxMyw5IEBAIGludCBrdm1fc2V0X2NyMChzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgY3IwKQogCWlmICghKGNyMCAmIFg4Nl9DUjBfUEcp
ICYmIGt2bV9yZWFkX2NyNF9iaXRzKHZjcHUsIFg4Nl9DUjRfUENJREUpKQogCQlyZXR1cm4gMTsK
IAorCWlmICgha3ZtaV9jcl9ldmVudCh2Y3B1LCAwLCBvbGRfY3IwLCAmY3IwKSkKKwkJcmV0dXJu
IDE7CisKIAlrdm1feDg2X29wcy5zZXRfY3IwKHZjcHUsIGNyMCk7CiAKIAlpZiAoKGNyMCBeIG9s
ZF9jcjApICYgWDg2X0NSMF9QRykgewpAQCAtOTkzLDYgKzk5Niw5IEBAIGludCBrdm1fc2V0X2Ny
NChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgY3I0KQogCQkJcmV0dXJuIDE7
CiAJfQogCisJaWYgKCFrdm1pX2NyX2V2ZW50KHZjcHUsIDQsIG9sZF9jcjQsICZjcjQpKQorCQly
ZXR1cm4gMTsKKwogCWlmIChrdm1feDg2X29wcy5zZXRfY3I0KHZjcHUsIGNyNCkpCiAJCXJldHVy
biAxOwogCkBAIC0xMDA5LDYgKzEwMTUsNyBAQCBFWFBPUlRfU1lNQk9MX0dQTChrdm1fc2V0X2Ny
NCk7CiAKIGludCBrdm1fc2V0X2NyMyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxv
bmcgY3IzKQogeworCXVuc2lnbmVkIGxvbmcgb2xkX2NyMyA9IGt2bV9yZWFkX2NyMyh2Y3B1KTsK
IAlib29sIHNraXBfdGxiX2ZsdXNoID0gZmFsc2U7CiAjaWZkZWYgQ09ORklHX1g4Nl82NAogCWJv
b2wgcGNpZF9lbmFibGVkID0ga3ZtX3JlYWRfY3I0X2JpdHModmNwdSwgWDg2X0NSNF9QQ0lERSk7
CkBAIC0xMDE5LDcgKzEwMjYsNyBAQCBpbnQga3ZtX3NldF9jcjMoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCB1bnNpZ25lZCBsb25nIGNyMykKIAl9CiAjZW5kaWYKIAotCWlmIChjcjMgPT0ga3ZtX3Jl
YWRfY3IzKHZjcHUpICYmICFwZHB0cnNfY2hhbmdlZCh2Y3B1KSkgeworCWlmIChjcjMgPT0gb2xk
X2NyMyAmJiAhcGRwdHJzX2NoYW5nZWQodmNwdSkpIHsKIAkJaWYgKCFza2lwX3RsYl9mbHVzaCkg
ewogCQkJa3ZtX21tdV9zeW5jX3Jvb3RzKHZjcHUpOwogCQkJa3ZtX21ha2VfcmVxdWVzdChLVk1f
UkVRX1RMQl9GTFVTSF9DVVJSRU5ULCB2Y3B1KTsKQEAgLTEwMzQsNiArMTA0MSw5IEBAIGludCBr
dm1fc2V0X2NyMyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgY3IzKQogCQkg
IWxvYWRfcGRwdHJzKHZjcHUsIHZjcHUtPmFyY2gud2Fsa19tbXUsIGNyMykpCiAJCXJldHVybiAx
OwogCisJaWYgKCFrdm1pX2NyX2V2ZW50KHZjcHUsIDMsIG9sZF9jcjMsICZjcjMpKQorCQlyZXR1
cm4gMTsKKwogCWt2bV9tbXVfbmV3X3BnZCh2Y3B1LCBjcjMsIHNraXBfdGxiX2ZsdXNoLCBza2lw
X3RsYl9mbHVzaCk7CiAJdmNwdS0+YXJjaC5jcjMgPSBjcjM7CiAJa3ZtX3JlZ2lzdGVyX21hcmtf
YXZhaWxhYmxlKHZjcHUsIFZDUFVfRVhSRUdfQ1IzKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFw
aS9saW51eC9rdm1pLmggYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oCmluZGV4IDIwYmY1YmYx
OTRhNC4uZTMxYjQ3NGUzNDk2IDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5o
CisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgKQEAgLTM0LDYgKzM0LDggQEAgZW51bSB7
CiAKIAlLVk1JX1ZNX0NPTlRST0xfQ0xFQU5VUCA9IDE0LAogCisJS1ZNSV9WQ1BVX0NPTlRST0xf
Q1IgPSAxNSwKKwogCUtWTUlfTlVNX01FU1NBR0VTCiB9OwogCkBAIC00Miw2ICs0NCw3IEBAIGVu
dW0gewogCUtWTUlfRVZFTlRfUEFVU0VfVkNQVSA9IDEsCiAJS1ZNSV9FVkVOVF9IWVBFUkNBTEwg
ID0gMiwKIAlLVk1JX0VWRU5UX0JSRUFLUE9JTlQgPSAzLAorCUtWTUlfRVZFTlRfQ1IgICAgICAg
ICA9IDQsCiAKIAlLVk1JX05VTV9FVkVOVFMKIH07CmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYwppbmRleCBkM2I3Nzc4YTY0ZDQuLjc2OTRmYThmZWY4
OSAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rl
c3QuYworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5j
CkBAIC01MCw2ICs1MCw3IEBAIHN0cnVjdCB2Y3B1X3dvcmtlcl9kYXRhIHsKIGVudW0gewogCUdV
RVNUX1RFU1RfTk9PUCA9IDAsCiAJR1VFU1RfVEVTVF9CUCwKKwlHVUVTVF9URVNUX0NSLAogCUdV
RVNUX1RFU1RfSFlQRVJDQUxMLAogfTsKIApAQCAtNzMsNiArNzQsMTEgQEAgc3RhdGljIHZvaWQg
Z3Vlc3RfYnBfdGVzdCh2b2lkKQogCWFzbSB2b2xhdGlsZSgiaW50MyIpOwogfQogCitzdGF0aWMg
dm9pZCBndWVzdF9jcl90ZXN0KHZvaWQpCit7CisJc2V0X2NyNChnZXRfY3I0KCkgfCBYODZfQ1I0
X09TWFNBVkUpOworfQorCiBzdGF0aWMgdm9pZCBndWVzdF9oeXBlcmNhbGxfdGVzdCh2b2lkKQog
ewogCWFzbSB2b2xhdGlsZSgibW92ICQzNCwgJXJheCIpOwpAQCAtOTAsNiArOTYsOSBAQCBzdGF0
aWMgdm9pZCBndWVzdF9jb2RlKHZvaWQpCiAJCWNhc2UgR1VFU1RfVEVTVF9CUDoKIAkJCWd1ZXN0
X2JwX3Rlc3QoKTsKIAkJCWJyZWFrOworCQljYXNlIEdVRVNUX1RFU1RfQ1I6CisJCQlndWVzdF9j
cl90ZXN0KCk7CisJCQlicmVhazsKIAkJY2FzZSBHVUVTVF9URVNUX0hZUEVSQ0FMTDoKIAkJCWd1
ZXN0X2h5cGVyY2FsbF90ZXN0KCk7CiAJCQlicmVhazsKQEAgLTEyMDEsNiArMTIxMCwxMDQgQEAg
c3RhdGljIHZvaWQgdGVzdF9jbWRfdm1fY29udHJvbF9jbGVhbnVwKHN0cnVjdCBrdm1fdm0gKnZt
KQogCWNtZF92bV9jb250cm9sX2NsZWFudXAoZGlzYWJsZSwgbm9fcGFkZGluZywgMCk7CiB9CiAK
K3N0YXRpYyB2b2lkIGNtZF92Y3B1X2NvbnRyb2xfY3Ioc3RydWN0IGt2bV92bSAqdm0sIF9fdTgg
Y3IsIF9fdTggZW5hYmxlLAorCQkJCV9fdTggcGFkZGluZywgaW50IGV4cGVjdGVkX2VycikKK3sK
KwlzdHJ1Y3QgeworCQlzdHJ1Y3Qga3ZtaV9tc2dfaGRyIGhkcjsKKwkJc3RydWN0IGt2bWlfdmNw
dV9oZHIgdmNwdV9oZHI7CisJCXN0cnVjdCBrdm1pX3ZjcHVfY29udHJvbF9jciBjbWQ7CisJfSBy
ZXEgPSB7fTsKKwlpbnQgcjsKKworCXJlcS5jbWQuY3IgPSBjcjsKKwlyZXEuY21kLmVuYWJsZSA9
IGVuYWJsZTsKKwlyZXEuY21kLnBhZGRpbmcxID0gcGFkZGluZzsKKwlyZXEuY21kLnBhZGRpbmcy
ID0gcGFkZGluZzsKKworCXIgPSBkb192Y3B1MF9jb21tYW5kKHZtLCBLVk1JX1ZDUFVfQ09OVFJP
TF9DUiwgJnJlcS5oZHIsIHNpemVvZihyZXEpLAorCQkJICAgICBOVUxMLCAwKTsKKwlURVNUX0FT
U0VSVChyID09IGV4cGVjdGVkX2VyciwKKwkJIktWTUlfVkNQVV9DT05UUk9MX0NSIGZhaWxlZCwg
ZXJyb3IgJWQoJXMpLCBleHBlY3RlZCBlcnJvciAlZFxuIiwKKwkJLXIsIGt2bV9zdHJlcnJvcigt
ciksIGV4cGVjdGVkX2Vycik7Cit9CisKK3N0YXRpYyB2b2lkIGVuYWJsZV9jcl9ldmVudHMoc3Ry
dWN0IGt2bV92bSAqdm0sIF9fdTggY3IpCit7CisJZW5hYmxlX3ZjcHVfZXZlbnQodm0sIEtWTUlf
RVZFTlRfQ1IpOworCisJY21kX3ZjcHVfY29udHJvbF9jcih2bSwgY3IsIDEsIDAsIDApOworfQor
CitzdGF0aWMgdm9pZCBkaXNhYmxlX2NyX2V2ZW50cyhzdHJ1Y3Qga3ZtX3ZtICp2bSwgX191OCBj
cikKK3sKKwljbWRfdmNwdV9jb250cm9sX2NyKHZtLCBjciwgMCwgMCwgMCk7CisKKwlkaXNhYmxl
X3ZjcHVfZXZlbnQodm0sIEtWTUlfRVZFTlRfQ1IpOworfQorCitzdGF0aWMgdm9pZCB0ZXN0X2lu
dmFsaWRfdmNwdV9jb250cm9sX2NyKHN0cnVjdCBrdm1fdm0gKnZtKQoreworCV9fdTggZW5hYmxl
ID0gMSwgZW5hYmxlX2ludmFsID0gMjsKKwlfX3U4IG5vX3BhZGRpbmcgPSAwLCBwYWRkaW5nID0g
MTsKKwlfX3U4IGNyX2ludmFsID0gOTksIGNyID0gMDsKKworCWNtZF92Y3B1X2NvbnRyb2xfY3Io
dm0sIGNyLCBlbmFibGVfaW52YWwsIG5vX3BhZGRpbmcsIC1LVk1fRUlOVkFMKTsKKwljbWRfdmNw
dV9jb250cm9sX2NyKHZtLCBjciwgZW5hYmxlLCBwYWRkaW5nLCAtS1ZNX0VJTlZBTCk7CisJY21k
X3ZjcHVfY29udHJvbF9jcih2bSwgY3JfaW52YWwsIGVuYWJsZSwgbm9fcGFkZGluZywgLUtWTV9F
SU5WQUwpOworfQorCitzdGF0aWMgdm9pZCB0ZXN0X2NtZF92Y3B1X2NvbnRyb2xfY3Ioc3RydWN0
IGt2bV92bSAqdm0pCit7CisJc3RydWN0IHZjcHVfd29ya2VyX2RhdGEgZGF0YSA9IHsKKwkJLnZt
ID0gdm0sCisJCS52Y3B1X2lkID0gVkNQVV9JRCwKKwkJLnRlc3RfaWQgPSBHVUVTVF9URVNUX0NS
LAorCX07CisJc3RydWN0IGt2bWlfbXNnX2hkciBoZHI7CisJc3RydWN0IHsKKwkJc3RydWN0IGt2
bWlfZXZlbnQgY29tbW9uOworCQlzdHJ1Y3Qga3ZtaV9ldmVudF9jciBjcjsKKwl9IGV2OworCXN0
cnVjdCB7CisJCXN0cnVjdCB2Y3B1X3JlcGx5IGNvbW1vbjsKKwkJc3RydWN0IGt2bWlfZXZlbnRf
Y3JfcmVwbHkgY3I7CisJfSBycGwgPSB7fTsKKwlfX3UxNiBldmVudF9pZCA9IEtWTUlfRVZFTlRf
Q1I7CisJX191OCBjcl9ubyA9IDQ7CisJc3RydWN0IGt2bV9zcmVncyBzcmVnczsKKwlwdGhyZWFk
X3QgdmNwdV90aHJlYWQ7CisKKwllbmFibGVfY3JfZXZlbnRzKHZtLCBjcl9ubyk7CisKKwl2Y3B1
X3RocmVhZCA9IHN0YXJ0X3ZjcHVfd29ya2VyKCZkYXRhKTsKKworCXJlY2VpdmVfZXZlbnQoJmhk
ciwgJmV2LmNvbW1vbiwgc2l6ZW9mKGV2KSwgZXZlbnRfaWQpOworCisJcHJfaW5mbygiQ1IldSwg
b2xkIDB4JWxseCwgbmV3IDB4JWxseFxuIiwKKwkJZXYuY3IuY3IsIGV2LmNyLm9sZF92YWx1ZSwg
ZXYuY3IubmV3X3ZhbHVlKTsKKworCVRFU1RfQVNTRVJUKGV2LmNyLmNyID09IGNyX25vLAorCQki
VW5leHBlY3RlZCBDUiBldmVudCwgcmVjZWl2ZWQgQ1IldSwgZXhwZWN0ZWQgQ1IldSIsCisJCWV2
LmNyLmNyLCBjcl9ubyk7CisKKwlycGwuY3IubmV3X3ZhbCA9IGV2LmNyLm9sZF92YWx1ZTsKKwor
CXJlcGx5X3RvX2V2ZW50KCZoZHIsICZldi5jb21tb24sIEtWTUlfRVZFTlRfQUNUSU9OX0NPTlRJ
TlVFLAorCQkJJnJwbC5jb21tb24sIHNpemVvZihycGwpKTsKKworCXN0b3BfdmNwdV93b3JrZXIo
dmNwdV90aHJlYWQsICZkYXRhKTsKKworCWRpc2FibGVfY3JfZXZlbnRzKHZtLCBjcl9ubyk7CisK
Kwl2Y3B1X3NyZWdzX2dldCh2bSwgVkNQVV9JRCwgJnNyZWdzKTsKKwlURVNUX0FTU0VSVChzcmVn
cy5jcjQgPT0gZXYuY3Iub2xkX3ZhbHVlLAorCQkiRmFpbGVkIHRvIGJsb2NrIENSNCB1cGRhdGUs
IENSNCAweCVsbHgsIGV4cGVjdGVkIDB4JWxseCIsCisJCXNyZWdzLmNyNCwgZXYuY3Iub2xkX3Zh
bHVlKTsKKworCXRlc3RfaW52YWxpZF92Y3B1X2NvbnRyb2xfY3Iodm0pOworfQorCiBzdGF0aWMg
dm9pZCB0ZXN0X2ludHJvc3BlY3Rpb24oc3RydWN0IGt2bV92bSAqdm0pCiB7CiAJc3JhbmRvbSh0
aW1lKDApKTsKQEAgLTEyMjQsNiArMTMzMSw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfaW50cm9zcGVj
dGlvbihzdHJ1Y3Qga3ZtX3ZtICp2bSkKIAl0ZXN0X2V2ZW50X2h5cGVyY2FsbCh2bSk7CiAJdGVz
dF9ldmVudF9icmVha3BvaW50KHZtKTsKIAl0ZXN0X2NtZF92bV9jb250cm9sX2NsZWFudXAodm0p
OworCXRlc3RfY21kX3ZjcHVfY29udHJvbF9jcih2bSk7CiAKIAl1bmhvb2tfaW50cm9zcGVjdGlv
bih2bSk7CiB9CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYyBiL3Zp
cnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jCmluZGV4IGRiMWY0NTIzY2VjNS4uMmRkODJhYTVl
MTFjIDEwMDY0NAotLS0gYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYworKysgYi92aXJ0
L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYwpAQCAtOTgsNiArOTgsNyBAQCBzdGF0aWMgdm9pZCBz
ZXR1cF9rbm93bl9ldmVudHModm9pZCkKIAogCWJpdG1hcF96ZXJvKEt2bWlfa25vd25fdmNwdV9l
dmVudHMsIEtWTUlfTlVNX0VWRU5UUyk7CiAJc2V0X2JpdChLVk1JX0VWRU5UX0JSRUFLUE9JTlQs
IEt2bWlfa25vd25fdmNwdV9ldmVudHMpOworCXNldF9iaXQoS1ZNSV9FVkVOVF9DUiwgS3ZtaV9r
bm93bl92Y3B1X2V2ZW50cyk7CiAJc2V0X2JpdChLVk1JX0VWRU5UX0hZUEVSQ0FMTCwgS3ZtaV9r
bm93bl92Y3B1X2V2ZW50cyk7CiAJc2V0X2JpdChLVk1JX0VWRU5UX1BBVVNFX1ZDUFUsIEt2bWlf
a25vd25fdmNwdV9ldmVudHMpOwogCmRpZmYgLS1naXQgYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9u
L2t2bWlfaW50LmggYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKaW5kZXggODMx
ZTdlMTQ1MjRmLi5jMjA2Mzc2ZWIwYWQgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rp
b24va3ZtaV9pbnQuaAorKysgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKQEAg
LTMxLDYgKzMxLDkgQEAgYm9vbCBrdm1pX3NvY2tfZ2V0KHN0cnVjdCBrdm1faW50cm9zcGVjdGlv
biAqa3ZtaSwgaW50IGZkKTsKIHZvaWQga3ZtaV9zb2NrX3NodXRkb3duKHN0cnVjdCBrdm1faW50
cm9zcGVjdGlvbiAqa3ZtaSk7CiB2b2lkIGt2bWlfc29ja19wdXQoc3RydWN0IGt2bV9pbnRyb3Nw
ZWN0aW9uICprdm1pKTsKIGJvb2wga3ZtaV9tc2dfcHJvY2VzcyhzdHJ1Y3Qga3ZtX2ludHJvc3Bl
Y3Rpb24gKmt2bWkpOworaW50IGt2bWlfc2VuZF9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
IHUzMiBldl9pZCwKKwkJICAgIHZvaWQgKmV2LCBzaXplX3QgZXZfc2l6ZSwKKwkJICAgIHZvaWQg
KnJwbCwgc2l6ZV90IHJwbF9zaXplLCBpbnQgKmFjdGlvbik7CiBpbnQga3ZtaV9tc2dfc2VuZF91
bmhvb2soc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pKTsKIHUzMiBrdm1pX21zZ19zZW5k
X3ZjcHVfcGF1c2Uoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIHUzMiBrdm1pX21zZ19zZW5kX2h5
cGVyY2FsbChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwpAQCAtNTAsNiArNTMsOCBAQCB2b2lkIGt2
bWlfcnVuX2pvYnMoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIHZvaWQga3ZtaV9wb3N0X3JlcGx5
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiB2b2lkIGt2bWlfaGFuZGxlX2NvbW1vbl9ldmVudF9h
Y3Rpb25zKHN0cnVjdCBrdm0gKmt2bSwgdTMyIGFjdGlvbik7CiB2b2lkIGt2bWlfY21kX3ZtX2Nv
bnRyb2xfY2xlYW51cChzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksIGJvb2wgZW5hYmxl
KTsKK3N0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqIF9fbXVzdF9jaGVjayBrdm1pX2dldChzdHJ1
Y3Qga3ZtICprdm0pOwordm9pZCBrdm1pX3B1dChzdHJ1Y3Qga3ZtICprdm0pOwogaW50IGt2bWlf
Y21kX3ZtX2NvbnRyb2xfZXZlbnRzKHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwKIAkJ
CQl1bnNpZ25lZCBpbnQgZXZlbnRfaWQsIGJvb2wgZW5hYmxlKTsKIGludCBrdm1pX2NtZF92Y3B1
X2NvbnRyb2xfZXZlbnRzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKQEAgLTkwLDUgKzk1LDcgQEAg
dm9pZCBrdm1pX2FyY2hfaHlwZXJjYWxsX2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiB2
b2lkIGt2bWlfYXJjaF9icmVha3BvaW50X2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTY0
IGd2YSwgdTggaW5zbl9sZW4pOwogaW50IGt2bWlfYXJjaF9jbWRfY29udHJvbF9pbnRlcmNlcHQo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJCSAgICB1bnNpZ25lZCBpbnQgZXZlbnRfaWQsIGJv
b2wgZW5hYmxlKTsKK2ludCBrdm1pX2FyY2hfY21kX3ZjcHVfY29udHJvbF9jcihzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsCisJCQkJICBjb25zdCBzdHJ1Y3Qga3ZtaV92Y3B1X2NvbnRyb2xfY3IgKnJl
cSk7CiAKICNlbmRpZgpkaWZmIC0tZ2l0IGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX21z
Zy5jIGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5jCmluZGV4IDg2Y2VlNDdkMjE0
Zi4uMzMwZmFkMjdlMWRmIDEwMDY0NAotLS0gYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlf
bXNnLmMKKysrIGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5jCkBAIC00ODEsNiAr
NDgxLDE3IEBAIHN0YXRpYyBpbnQgaGFuZGxlX3ZjcHVfZ2V0X2NwdWlkKGNvbnN0IHN0cnVjdCBr
dm1pX3ZjcHVfbXNnX2pvYiAqam9iLAogCXJldHVybiBrdm1pX21zZ192Y3B1X3JlcGx5KGpvYiwg
bXNnLCBlYywgJnJwbCwgc2l6ZW9mKHJwbCkpOwogfQogCitzdGF0aWMgaW50IGhhbmRsZV92Y3B1
X2NvbnRyb2xfY3IoY29uc3Qgc3RydWN0IGt2bWlfdmNwdV9tc2dfam9iICpqb2IsCisJCQkJICBj
b25zdCBzdHJ1Y3Qga3ZtaV9tc2dfaGRyICptc2csCisJCQkJICBjb25zdCB2b2lkICpyZXEpCit7
CisJaW50IGVjOworCisJZWMgPSBrdm1pX2FyY2hfY21kX3ZjcHVfY29udHJvbF9jcihqb2ItPnZj
cHUsIHJlcSk7CisKKwlyZXR1cm4ga3ZtaV9tc2dfdmNwdV9yZXBseShqb2IsIG1zZywgZWMsIE5V
TEwsIDApOworfQorCiAvKgogICogVGhlc2UgZnVuY3Rpb25zIGFyZSBleGVjdXRlZCBmcm9tIHRo
ZSB2Q1BVIHRocmVhZC4gVGhlIHJlY2VpdmluZyB0aHJlYWQKICAqIHBhc3NlcyB0aGUgbWVzc2Fn
ZXMgdXNpbmcgYSBuZXdseSBhbGxvY2F0ZWQgJ3N0cnVjdCBrdm1pX3ZjcHVfbXNnX2pvYicKQEAg
LTQ5MCw2ICs1MDEsNyBAQCBzdGF0aWMgaW50IGhhbmRsZV92Y3B1X2dldF9jcHVpZChjb25zdCBz
dHJ1Y3Qga3ZtaV92Y3B1X21zZ19qb2IgKmpvYiwKIHN0YXRpYyBpbnQoKmNvbnN0IG1zZ192Y3B1
W10pKGNvbnN0IHN0cnVjdCBrdm1pX3ZjcHVfbXNnX2pvYiAqLAogCQkJICAgICAgY29uc3Qgc3Ry
dWN0IGt2bWlfbXNnX2hkciAqLCBjb25zdCB2b2lkICopID0gewogCVtLVk1JX0VWRU5UXSAgICAg
ICAgICAgICAgID0gaGFuZGxlX3ZjcHVfZXZlbnRfcmVwbHksCisJW0tWTUlfVkNQVV9DT05UUk9M
X0NSXSAgICAgPSBoYW5kbGVfdmNwdV9jb250cm9sX2NyLAogCVtLVk1JX1ZDUFVfQ09OVFJPTF9F
VkVOVFNdID0gaGFuZGxlX3ZjcHVfY29udHJvbF9ldmVudHMsCiAJW0tWTUlfVkNQVV9HRVRfQ1BV
SURdICAgICAgPSBoYW5kbGVfdmNwdV9nZXRfY3B1aWQsCiAJW0tWTUlfVkNQVV9HRVRfSU5GT10g
ICAgICAgPSBoYW5kbGVfdmNwdV9nZXRfaW5mbywKQEAgLTc1OCw5ICs3NzAsOSBAQCBzdGF0aWMg
dm9pZCBrdm1pX3NldHVwX3ZjcHVfcmVwbHkoc3RydWN0IGt2bV92Y3B1X2ludHJvc3BlY3Rpb24g
KnZjcHVpLAogCXZjcHVpLT53YWl0aW5nX2Zvcl9yZXBseSA9IHRydWU7CiB9CiAKLXN0YXRpYyBp
bnQga3ZtaV9zZW5kX2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTMyIGV2X2lkLAotCQkJ
ICAgdm9pZCAqZXYsIHNpemVfdCBldl9zaXplLAotCQkJICAgdm9pZCAqcnBsLCBzaXplX3QgcnBs
X3NpemUsIGludCAqYWN0aW9uKQoraW50IGt2bWlfc2VuZF9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsIHUzMiBldl9pZCwKKwkJICAgIHZvaWQgKmV2LCBzaXplX3QgZXZfc2l6ZSwKKwkJICAg
IHZvaWQgKnJwbCwgc2l6ZV90IHJwbF9zaXplLCBpbnQgKmFjdGlvbikKIHsKIAlzdHJ1Y3Qga3Zt
aV9tc2dfaGRyIGhkcjsKIAlzdHJ1Y3Qga3ZtaV9ldmVudCBjb21tb247Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
