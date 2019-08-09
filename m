Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3397A88180
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 19:45:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 67A0ADB6;
	Fri,  9 Aug 2019 17:44:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DB992CBB
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:44:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D345D829
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:44:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	94E62305D360; Fri,  9 Aug 2019 19:01:39 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 4DB88305B7A1;
	Fri,  9 Aug 2019 19:01:39 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 78/92] kvm: x86: add tracepoints for interrupt and
	exception injections
Date: Fri,  9 Aug 2019 19:00:33 +0300
Message-Id: <20190809160047.8319-79-alazar@bitdefender.com>
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C <yu.c.zhang@intel.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?q?Samuel=20Laur=C3=A9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	virtualization@lists.linux-foundation.org,
	=?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
	=?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <ncitu@bitdefender.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Zhang@mail.linuxfoundation.org,
	=?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGlzIHBhdGNo
IGludHJvZHVjZXMgYWRkaXRpb25hbCB0cmFjZXBvaW50cyB0aGF0IGFyZSBtZWFudCB0byBoZWxw
CmluIGZvbGxvd2luZyB0aGUgZmxvdyBvZiBpbnRlcnJ1cHRzIGFuZCBleGNlcHRpb25zIHF1ZXVl
ZCB0byBhIGd1ZXN0ClZNLiBBdCB0aGUgc2FtZSB0aW1lIHRoZSBrdm1fZXhpdCB0cmFjZXBvaW50
IGlzIGVuaGFuY2VkIHdpdGggdGhlCnZDUFUgSUQuCgpPbmUgc2NlbmFyaW8gaW4gd2hpY2ggdGhl
c2UgaGVscCBpcyBkZWJ1Z2dpbmcgbG9zdCBpbnRlcnJ1cHRzIGR1ZSB0bwphIGJ1Z2d5IFZNRVhJ
VCBoYW5kbGVyLgoKU2lnbmVkLW9mZi1ieTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZl
bmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVu
ZGVyLmNvbT4KLS0tCiBhcmNoL3g4Ni9rdm0vc3ZtLmMgICAgIHwgICA5ICsrKy0KIGFyY2gveDg2
L2t2bS90cmFjZS5oICAgfCAxMTggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0KIGFyY2gveDg2L2t2bS92bXgvdm14LmMgfCAgIDggKystCiBhcmNoL3g4Ni9rdm0veDg2
LmMgICAgIHwgIDEyICsrKy0tCiA0IGZpbGVzIGNoYW5nZWQsIDExNiBpbnNlcnRpb25zKCspLCAz
MSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vc3ZtLmMgYi9hcmNoL3g4
Ni9rdm0vc3ZtLmMKaW5kZXggY2I1MzZhMjYxMWY2Li4wMGJkZjg4NWY5YTQgMTAwNjQ0Ci0tLSBh
L2FyY2gveDg2L2t2bS9zdm0uYworKysgYi9hcmNoL3g4Ni9rdm0vc3ZtLmMKQEAgLTc5OSw2ICs3
OTksOCBAQCBzdGF0aWMgdm9pZCBzdm1fcXVldWVfZXhjZXB0aW9uKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSkKIAlib29sIHJlaW5qZWN0ID0gdmNwdS0+YXJjaC5leGNlcHRpb24uaW5qZWN0ZWQ7CiAJ
dTMyIGVycm9yX2NvZGUgPSB2Y3B1LT5hcmNoLmV4Y2VwdGlvbi5lcnJvcl9jb2RlOwogCisJdHJh
Y2Vfa3ZtX2lual9leGNlcHRpb24odmNwdSk7CisKIAkvKgogCSAqIElmIHdlIGFyZSB3aXRoaW4g
YSBuZXN0ZWQgVk0gd2UnZCBiZXR0ZXIgI1ZNRVhJVCBhbmQgbGV0IHRoZSBndWVzdAogCSAqIGhh
bmRsZSB0aGUgZXhjZXB0aW9uCkBAIC01MTA4LDYgKzUxMTAsOCBAQCBzdGF0aWMgdm9pZCBzdm1f
aW5qZWN0X25taShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiB7CiAJc3RydWN0IHZjcHVfc3ZtICpz
dm0gPSB0b19zdm0odmNwdSk7CiAKKwl0cmFjZV9rdm1faW5qX25taSh2Y3B1KTsKKwogCXN2bS0+
dm1jYi0+Y29udHJvbC5ldmVudF9pbmogPSBTVk1fRVZUSU5KX1ZBTElEIHwgU1ZNX0VWVElOSl9U
WVBFX05NSTsKIAl2Y3B1LT5hcmNoLmhmbGFncyB8PSBIRl9OTUlfTUFTSzsKIAlzZXRfaW50ZXJj
ZXB0KHN2bSwgSU5URVJDRVBUX0lSRVQpOwpAQCAtNTEzMyw3ICs1MTM3LDggQEAgc3RhdGljIHZv
aWQgc3ZtX3NldF9pcnEoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCiAJQlVHX09OKCEoZ2lmX3Nl
dChzdm0pKSk7CiAKLQl0cmFjZV9rdm1faW5qX3ZpcnEodmNwdS0+YXJjaC5pbnRlcnJ1cHQubnIp
OworCXRyYWNlX2t2bV9pbmpfaW50ZXJydXB0KHZjcHUpOworCiAJKyt2Y3B1LT5zdGF0LmlycV9p
bmplY3Rpb25zOwogCiAJc3ZtLT52bWNiLT5jb250cm9sLmV2ZW50X2luaiA9IHZjcHUtPmFyY2gu
aW50ZXJydXB0Lm5yIHwKQEAgLTU2MzcsNiArNTY0Miw4IEBAIHN0YXRpYyB2b2lkIHN2bV9jYW5j
ZWxfaW5qZWN0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAlzdHJ1Y3QgdmNwdV9zdm0gKnN2
bSA9IHRvX3N2bSh2Y3B1KTsKIAlzdHJ1Y3Qgdm1jYl9jb250cm9sX2FyZWEgKmNvbnRyb2wgPSAm
c3ZtLT52bWNiLT5jb250cm9sOwogCisJdHJhY2Vfa3ZtX2NhbmNlbF9pbmoodmNwdSk7CisKIAlj
b250cm9sLT5leGl0X2ludF9pbmZvID0gY29udHJvbC0+ZXZlbnRfaW5qOwogCWNvbnRyb2wtPmV4
aXRfaW50X2luZm9fZXJyID0gY29udHJvbC0+ZXZlbnRfaW5qX2VycjsKIAljb250cm9sLT5ldmVu
dF9pbmogPSAwOwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3RyYWNlLmggYi9hcmNoL3g4Ni9r
dm0vdHJhY2UuaAppbmRleCA2NDMyZDA4YzdkZTcuLmNiNDc4ODlkZGMyYyAxMDA2NDQKLS0tIGEv
YXJjaC94ODYva3ZtL3RyYWNlLmgKKysrIGIvYXJjaC94ODYva3ZtL3RyYWNlLmgKQEAgLTIyNyw2
ICsyMjcsNyBAQCBUUkFDRV9FVkVOVChrdm1fZXhpdCwKIAlUUF9BUkdTKGV4aXRfcmVhc29uLCB2
Y3B1LCBpc2EpLAogCiAJVFBfU1RSVUNUX19lbnRyeSgKKwkJX19maWVsZCgJdW5zaWduZWQgaW50
LAl2Y3B1X2lkCQkpCiAJCV9fZmllbGQoCXVuc2lnbmVkIGludCwJZXhpdF9yZWFzb24JKQogCQlf
X2ZpZWxkKAl1bnNpZ25lZCBsb25nLAlndWVzdF9yaXAJKQogCQlfX2ZpZWxkKAl1MzIsCSAgICAg
ICAgaXNhICAgICAgICAgICAgICkKQEAgLTIzNSw2ICsyMzYsNyBAQCBUUkFDRV9FVkVOVChrdm1f
ZXhpdCwKIAkpLAogCiAJVFBfZmFzdF9hc3NpZ24oCisJCV9fZW50cnktPnZjcHVfaWQJPSB2Y3B1
LT52Y3B1X2lkOwogCQlfX2VudHJ5LT5leGl0X3JlYXNvbgk9IGV4aXRfcmVhc29uOwogCQlfX2Vu
dHJ5LT5ndWVzdF9yaXAJPSBrdm1fcmlwX3JlYWQodmNwdSk7CiAJCV9fZW50cnktPmlzYSAgICAg
ICAgICAgID0gaXNhOwpAQCAtMjQyLDcgKzI0NCw4IEBAIFRSQUNFX0VWRU5UKGt2bV9leGl0LAog
CQkJCQkgICAmX19lbnRyeS0+aW5mbzIpOwogCSksCiAKLQlUUF9wcmludGsoInJlYXNvbiAlcyBy
aXAgMHglbHggaW5mbyAlbGx4ICVsbHgiLAorCVRQX3ByaW50aygidmNwdSAldSByZWFzb24gJXMg
cmlwIDB4JWx4IGluZm8gJWxseCAlbGx4IiwKKwkJIF9fZW50cnktPnZjcHVfaWQsCiAJCSAoX19l
bnRyeS0+aXNhID09IEtWTV9JU0FfVk1YKSA/CiAJCSBfX3ByaW50X3N5bWJvbGljKF9fZW50cnkt
PmV4aXRfcmVhc29uLCBWTVhfRVhJVF9SRUFTT05TKSA6CiAJCSBfX3ByaW50X3N5bWJvbGljKF9f
ZW50cnktPmV4aXRfcmVhc29uLCBTVk1fRVhJVF9SRUFTT05TKSwKQEAgLTI1MiwxOSArMjU1LDM4
IEBAIFRSQUNFX0VWRU5UKGt2bV9leGl0LAogLyoKICAqIFRyYWNlcG9pbnQgZm9yIGt2bSBpbnRl
cnJ1cHQgaW5qZWN0aW9uOgogICovCi1UUkFDRV9FVkVOVChrdm1faW5qX3ZpcnEsCi0JVFBfUFJP
VE8odW5zaWduZWQgaW50IGlycSksCi0JVFBfQVJHUyhpcnEpLAotCitUUkFDRV9FVkVOVChrdm1f
aW5qX2ludGVycnVwdCwKKwlUUF9QUk9UTyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpLAorCVRQX0FS
R1ModmNwdSksCiAJVFBfU1RSVUNUX19lbnRyeSgKLQkJX19maWVsZCgJdW5zaWduZWQgaW50LAlp
cnEJCSkKKwkJX19maWVsZChfX3UzMiwgdmNwdV9pZCkKKwkJX19maWVsZChfX3UzMiwgbnIpCiAJ
KSwKLQogCVRQX2Zhc3RfYXNzaWduKAotCQlfX2VudHJ5LT5pcnEJCT0gaXJxOworCQlfX2VudHJ5
LT52Y3B1X2lkID0gdmNwdS0+dmNwdV9pZDsKKwkJX19lbnRyeS0+bnIgPSB2Y3B1LT5hcmNoLmlu
dGVycnVwdC5ucjsKIAkpLAorCVRQX3ByaW50aygidmNwdSAldSBpcnEgJXUiLAorCQkgIF9fZW50
cnktPnZjcHVfaWQsCisJCSAgX19lbnRyeS0+bnIKKwkpCispOwogCi0JVFBfcHJpbnRrKCJpcnEg
JXUiLCBfX2VudHJ5LT5pcnEpCisvKgorICogVHJhY2Vwb2ludCBmb3Iga3ZtIG5taSBpbmplY3Rp
b246CisgKi8KK1RSQUNFX0VWRU5UKGt2bV9pbmpfbm1pLAorCVRQX1BST1RPKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSksCisJVFBfQVJHUyh2Y3B1KSwKKwlUUF9TVFJVQ1RfX2VudHJ5KAorCQlfX2Zp
ZWxkKF9fdTMyLCB2Y3B1X2lkKQorCSksCisJVFBfZmFzdF9hc3NpZ24oCisJCV9fZW50cnktPnZj
cHVfaWQgPSB2Y3B1LT52Y3B1X2lkOworCSksCisJVFBfcHJpbnRrKCJ2Y3B1ICV1IiwKKwkJICBf
X2VudHJ5LT52Y3B1X2lkCisJKQogKTsKIAogI2RlZmluZSBFWFMoeCkgeyB4IyNfVkVDVE9SLCAi
IyIgI3ggfQpAQCAtMjc1LDI4ICsyOTcsNzYgQEAgVFJBQ0VfRVZFTlQoa3ZtX2lual92aXJxLAog
CUVYUyhNRiksIEVYUyhBQyksIEVYUyhNQykKIAogLyoKLSAqIFRyYWNlcG9pbnQgZm9yIGt2bSBp
bnRlcnJ1cHQgaW5qZWN0aW9uOgorICogVHJhY2Vwb2ludCBmb3Iga3ZtIGV4Y2VwdGlvbiBpbmpl
Y3Rpb246CiAgKi8KLVRSQUNFX0VWRU5UKGt2bV9pbmpfZXhjZXB0aW9uLAotCVRQX1BST1RPKHVu
c2lnbmVkIGV4Y2VwdGlvbiwgYm9vbCBoYXNfZXJyb3IsIHVuc2lnbmVkIGVycm9yX2NvZGUpLAot
CVRQX0FSR1MoZXhjZXB0aW9uLCBoYXNfZXJyb3IsIGVycm9yX2NvZGUpLAotCitUUkFDRV9FVkVO
VCgKKwlrdm1faW5qX2V4Y2VwdGlvbiwKKwlUUF9QUk9UTyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
LAorCVRQX0FSR1ModmNwdSksCiAJVFBfU1RSVUNUX19lbnRyeSgKLQkJX19maWVsZCgJdTgsCWV4
Y2VwdGlvbgkpCi0JCV9fZmllbGQoCXU4LAloYXNfZXJyb3IJKQotCQlfX2ZpZWxkKAl1MzIsCWVy
cm9yX2NvZGUJKQorCQlfX2ZpZWxkKF9fdTMyLCB2Y3B1X2lkKQorCQlfX2ZpZWxkKF9fdTgsIG5y
KQorCQlfX2ZpZWxkKF9fdTY0LCBhZGRyZXNzKQorCQlfX2ZpZWxkKF9fdTE2LCBlcnJvcl9jb2Rl
KQorCQlfX2ZpZWxkKGJvb2wsIGhhc19lcnJvcl9jb2RlKQogCSksCisJVFBfZmFzdF9hc3NpZ24o
CisJCV9fZW50cnktPnZjcHVfaWQgPSB2Y3B1LT52Y3B1X2lkOworCQlfX2VudHJ5LT5uciA9IHZj
cHUtPmFyY2guZXhjZXB0aW9uLm5yOworCQlfX2VudHJ5LT5hZGRyZXNzID0gdmNwdS0+YXJjaC5l
eGNlcHRpb24ubmVzdGVkX2FwZiA/CisJCQl2Y3B1LT5hcmNoLmFwZi5uZXN0ZWRfYXBmX3Rva2Vu
IDogdmNwdS0+YXJjaC5jcjI7CisJCV9fZW50cnktPmVycm9yX2NvZGUgPSB2Y3B1LT5hcmNoLmV4
Y2VwdGlvbi5lcnJvcl9jb2RlOworCQlfX2VudHJ5LT5oYXNfZXJyb3JfY29kZSA9IHZjcHUtPmFy
Y2guZXhjZXB0aW9uLmhhc19lcnJvcl9jb2RlOworCSksCisJVFBfcHJpbnRrKCJ2Y3B1ICV1ICVz
IGFkZHJlc3MgJWxseCBlcnJvciAleCIsCisJCSAgX19lbnRyeS0+dmNwdV9pZCwKKwkJICBfX3By
aW50X3N5bWJvbGljKF9fZW50cnktPm5yLCBrdm1fdHJhY2Vfc3ltX2V4YyksCisJCSAgX19lbnRy
eS0+bnIgPT0gUEZfVkVDVE9SID8gX19lbnRyeS0+YWRkcmVzcyA6IDAsCisJCSAgX19lbnRyeS0+
aGFzX2Vycm9yX2NvZGUgPyBfX2VudHJ5LT5lcnJvcl9jb2RlIDogMAorCSkKKyk7CiAKK1RSQUNF
X0VWRU5UKAorCWt2bV9pbmpfZW11bF9leGNlcHRpb24sCisJVFBfUFJPVE8oc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBzdHJ1Y3QgeDg2X2V4Y2VwdGlvbiAqZmF1bHQpLAorCVRQX0FSR1ModmNwdSwg
ZmF1bHQpLAorCVRQX1NUUlVDVF9fZW50cnkoCisJCV9fZmllbGQoX191MzIsIHZjcHVfaWQpCisJ
CV9fZmllbGQoX191OCwgdmVjdG9yKQorCQlfX2ZpZWxkKF9fdTY0LCBhZGRyZXNzKQorCQlfX2Zp
ZWxkKF9fdTE2LCBlcnJvcl9jb2RlKQorCQlfX2ZpZWxkKGJvb2wsIGVycm9yX2NvZGVfdmFsaWQp
CisJKSwKIAlUUF9mYXN0X2Fzc2lnbigKLQkJX19lbnRyeS0+ZXhjZXB0aW9uCT0gZXhjZXB0aW9u
OwotCQlfX2VudHJ5LT5oYXNfZXJyb3IJPSBoYXNfZXJyb3I7Ci0JCV9fZW50cnktPmVycm9yX2Nv
ZGUJPSBlcnJvcl9jb2RlOworCQlfX2VudHJ5LT52Y3B1X2lkID0gdmNwdS0+dmNwdV9pZDsKKwkJ
X19lbnRyeS0+dmVjdG9yID0gZmF1bHQtPnZlY3RvcjsKKwkJX19lbnRyeS0+YWRkcmVzcyA9IGZh
dWx0LT5hZGRyZXNzOworCQlfX2VudHJ5LT5lcnJvcl9jb2RlID0gZmF1bHQtPmVycm9yX2NvZGU7
CisJCV9fZW50cnktPmVycm9yX2NvZGVfdmFsaWQgPSBmYXVsdC0+ZXJyb3JfY29kZV92YWxpZDsK
IAkpLAorCVRQX3ByaW50aygidmNwdSAldSAlcyBhZGRyZXNzICVsbHggZXJyb3IgJXgiLAorCQkg
IF9fZW50cnktPnZjcHVfaWQsCisJCSAgX19wcmludF9zeW1ib2xpYyhfX2VudHJ5LT52ZWN0b3Is
IGt2bV90cmFjZV9zeW1fZXhjKSwKKwkJICBfX2VudHJ5LT52ZWN0b3IgPT0gUEZfVkVDVE9SID8g
X19lbnRyeS0+YWRkcmVzcyA6IDAsCisJCSAgX19lbnRyeS0+ZXJyb3JfY29kZV92YWxpZCA/IF9f
ZW50cnktPmVycm9yX2NvZGUgOiAwCisJKQorKTsKIAotCVRQX3ByaW50aygiJXMgKDB4JXgpIiwK
LQkJICBfX3ByaW50X3N5bWJvbGljKF9fZW50cnktPmV4Y2VwdGlvbiwga3ZtX3RyYWNlX3N5bV9l
eGMpLAotCQkgIC8qIEZJWE1FOiBkb24ndCBwcmludCBlcnJvcl9jb2RlIGlmIG5vdCBwcmVzZW50
ICovCi0JCSAgX19lbnRyeS0+aGFzX2Vycm9yID8gX19lbnRyeS0+ZXJyb3JfY29kZSA6IDApCisv
KgorICogVHJhY2Vwb2ludCBmb3Iga3ZtIGNhbmNlbCBpbmplY3Rpb246CisgKi8KK1RSQUNFX0VW
RU5UKGt2bV9jYW5jZWxfaW5qLAorCVRQX1BST1RPKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSksCisJ
VFBfQVJHUyh2Y3B1KSwKKwlUUF9TVFJVQ1RfX2VudHJ5KAorCQlfX2ZpZWxkKF9fdTMyLCB2Y3B1
X2lkKQorCSksCisJVFBfZmFzdF9hc3NpZ24oCisJCV9fZW50cnktPnZjcHVfaWQgPSB2Y3B1LT52
Y3B1X2lkOworCSksCisJVFBfcHJpbnRrKCJ2Y3B1ICV1IiwKKwkJICBfX2VudHJ5LT52Y3B1X2lk
CisJKQogKTsKIAogLyoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMgYi9hcmNo
L3g4Ni9rdm0vdm14L3ZteC5jCmluZGV4IDE1MmM1OGI2M2Y2OS4uODU1NjE5OTQ2NjFhIDEwMDY0
NAotLS0gYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCisrKyBiL2FyY2gveDg2L2t2bS92bXgvdm14
LmMKQEAgLTE0OTQsNiArMTQ5NCw4IEBAIHN0YXRpYyB2b2lkIHZteF9xdWV1ZV9leGNlcHRpb24o
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCXUzMiBlcnJvcl9jb2RlID0gdmNwdS0+YXJjaC5leGNl
cHRpb24uZXJyb3JfY29kZTsKIAl1MzIgaW50cl9pbmZvID0gbnIgfCBJTlRSX0lORk9fVkFMSURf
TUFTSzsKIAorCXRyYWNlX2t2bV9pbmpfZXhjZXB0aW9uKHZjcHUpOworCiAJa3ZtX2RlbGl2ZXJf
ZXhjZXB0aW9uX3BheWxvYWQodmNwdSk7CiAKIAlpZiAoaGFzX2Vycm9yX2NvZGUpIHsKQEAgLTQy
NjYsNyArNDI2OCw3IEBAIHN0YXRpYyB2b2lkIHZteF9pbmplY3RfaXJxKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSkKIAl1aW50MzJfdCBpbnRyOwogCWludCBpcnEgPSB2Y3B1LT5hcmNoLmludGVycnVw
dC5ucjsKIAotCXRyYWNlX2t2bV9pbmpfdmlycShpcnEpOworCXRyYWNlX2t2bV9pbmpfaW50ZXJy
dXB0KHZjcHUpOwogCiAJKyt2Y3B1LT5zdGF0LmlycV9pbmplY3Rpb25zOwogCWlmICh2bXgtPnJt
b2RlLnZtODZfYWN0aXZlKSB7CkBAIC00MjkzLDYgKzQyOTUsOCBAQCBzdGF0aWMgdm9pZCB2bXhf
aW5qZWN0X25taShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiB7CiAJc3RydWN0IHZjcHVfdm14ICp2
bXggPSB0b192bXgodmNwdSk7CiAKKwl0cmFjZV9rdm1faW5qX25taSh2Y3B1KTsKKwogCWlmICgh
ZW5hYmxlX3ZubWkpIHsKIAkJLyoKIAkJICogVHJhY2tpbmcgdGhlIE5NSS1ibG9ja2VkIHN0YXRl
IGluIHNvZnR3YXJlIGlzIGJ1aWx0IHVwb24KQEAgLTY0NTIsNiArNjQ1Niw4IEBAIHN0YXRpYyB2
b2lkIHZteF9jb21wbGV0ZV9pbnRlcnJ1cHRzKHN0cnVjdCB2Y3B1X3ZteCAqdm14KQogCiBzdGF0
aWMgdm9pZCB2bXhfY2FuY2VsX2luamVjdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiB7CisJ
dHJhY2Vfa3ZtX2NhbmNlbF9pbmoodmNwdSk7CisKIAlfX3ZteF9jb21wbGV0ZV9pbnRlcnJ1cHRz
KHZjcHUsCiAJCQkJICB2bWNzX3JlYWQzMihWTV9FTlRSWV9JTlRSX0lORk9fRklFTEQpLAogCQkJ
CSAgVk1fRU5UUllfSU5TVFJVQ1RJT05fTEVOLApkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3g4
Ni5jIGIvYXJjaC94ODYva3ZtL3g4Ni5jCmluZGV4IDM5NzUzMzEyMzBiOS4uZTA5YTc2MTc5YzRi
IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0veDg2LmMKKysrIGIvYXJjaC94ODYva3ZtL3g4Ni5j
CkBAIC02MTc4LDYgKzYxNzgsOSBAQCBzdGF0aWMgdm9pZCB0b2dnbGVfaW50ZXJydXB0aWJpbGl0
eShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHUzMiBtYXNrKQogc3RhdGljIGJvb2wgaW5qZWN0X2Vt
dWxhdGVkX2V4Y2VwdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiB7CiAJc3RydWN0IHg4Nl9l
bXVsYXRlX2N0eHQgKmN0eHQgPSAmdmNwdS0+YXJjaC5lbXVsYXRlX2N0eHQ7CisKKwl0cmFjZV9r
dm1faW5qX2VtdWxfZXhjZXB0aW9uKHZjcHUsICZjdHh0LT5leGNlcHRpb24pOworCiAJaWYgKGN0
eHQtPmV4Y2VwdGlvbi52ZWN0b3IgPT0gUEZfVkVDVE9SKQogCQlyZXR1cm4ga3ZtX3Byb3BhZ2F0
ZV9mYXVsdCh2Y3B1LCAmY3R4dC0+ZXhjZXB0aW9uKTsKIApAQCAtNzQ4NywxMCArNzQ5MCw2IEBA
IHN0YXRpYyBpbnQgaW5qZWN0X3BlbmRpbmdfZXZlbnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBi
b29sIHJlcV9pbnRfd2luKQogCiAJLyogdHJ5IHRvIGluamVjdCBuZXcgZXZlbnQgaWYgcGVuZGlu
ZyAqLwogCWlmICh2Y3B1LT5hcmNoLmV4Y2VwdGlvbi5wZW5kaW5nKSB7Ci0JCXRyYWNlX2t2bV9p
bmpfZXhjZXB0aW9uKHZjcHUtPmFyY2guZXhjZXB0aW9uLm5yLAotCQkJCQl2Y3B1LT5hcmNoLmV4
Y2VwdGlvbi5oYXNfZXJyb3JfY29kZSwKLQkJCQkJdmNwdS0+YXJjaC5leGNlcHRpb24uZXJyb3Jf
Y29kZSk7Ci0KIAkJV0FSTl9PTl9PTkNFKHZjcHUtPmFyY2guZXhjZXB0aW9uLmluamVjdGVkKTsK
IAkJdmNwdS0+YXJjaC5leGNlcHRpb24ucGVuZGluZyA9IGZhbHNlOwogCQl2Y3B1LT5hcmNoLmV4
Y2VwdGlvbi5pbmplY3RlZCA9IHRydWU7CkBAIC0xMDI1MCw3ICsxMDI0OSwxMCBAQCBFWFBPUlRf
U1lNQk9MKGt2bV9hcmNoX3ZjcHVfaW50ZXJjZXB0X2Rlc2MpOwogCiBFWFBPUlRfVFJBQ0VQT0lO
VF9TWU1CT0xfR1BMKGt2bV9leGl0KTsKIEVYUE9SVF9UUkFDRVBPSU5UX1NZTUJPTF9HUEwoa3Zt
X2Zhc3RfbW1pbyk7Ci1FWFBPUlRfVFJBQ0VQT0lOVF9TWU1CT0xfR1BMKGt2bV9pbmpfdmlycSk7
CitFWFBPUlRfVFJBQ0VQT0lOVF9TWU1CT0xfR1BMKGt2bV9pbmpfaW50ZXJydXB0KTsKK0VYUE9S
VF9UUkFDRVBPSU5UX1NZTUJPTF9HUEwoa3ZtX2lual9ubWkpOworRVhQT1JUX1RSQUNFUE9JTlRf
U1lNQk9MX0dQTChrdm1faW5qX2V4Y2VwdGlvbik7CitFWFBPUlRfVFJBQ0VQT0lOVF9TWU1CT0xf
R1BMKGt2bV9jYW5jZWxfaW5qKTsKIEVYUE9SVF9UUkFDRVBPSU5UX1NZTUJPTF9HUEwoa3ZtX3Bh
Z2VfZmF1bHQpOwogRVhQT1JUX1RSQUNFUE9JTlRfU1lNQk9MX0dQTChrdm1fbXNyKTsKIEVYUE9S
VF9UUkFDRVBPSU5UX1NZTUJPTF9HUEwoa3ZtX2NyKTsKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1
YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
