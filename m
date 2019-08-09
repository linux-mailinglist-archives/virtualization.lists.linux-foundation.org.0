Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4CC881F7
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 20:05:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DD06EDAF;
	Fri,  9 Aug 2019 18:04:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 16B8AD09
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:04:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AFFA676F
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:04:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	E7272305D3D4; Fri,  9 Aug 2019 19:00:56 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 67D83305B7A0;
	Fri,  9 Aug 2019 19:00:56 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 13/92] kvm: introspection: make the vCPU wait even when
	its jobs list is empty
Date: Fri,  9 Aug 2019 18:59:28 +0300
Message-Id: <20190809160047.8319-14-alazar@bitdefender.com>
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
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

VXN1YWxseSwgdGhlIHZDUFUgdGhyZWFkIHdpbGwgcnVuIHRoZSBmdW5jdGlvbnMgZnJvbSBpdHMg
am9icyBsaXN0Cih1bmxlc3MgdGhlIHRocmVhZCBpcyBTSUdLSUxMLWVkKSBhbmQgY29udGludWUg
dG8gZ3Vlc3Qgd2hlbiB0aGUKbGlzdCBpcyBlbXB0eS4gQnV0LCB0aGVyZSBhcmUgY2FzZXMgd2hl
biBpdCBoYXMgdG8gd2FpdCBmb3Igc29tZXRoaW5nCihlLmcuIGFub3RoZXIgdkNQVSBydW5zIGlu
IHNpbmdsZS1zdGVwIG1vZGUsIG9yIHRoZSBjdXJyZW50IHZDUFUgd2FpdHMKZm9yIGFuIGV2ZW50
IHJlcGx5IGZyb20gdGhlIGludHJvc3BlY3Rpb24gdG9vbCkuCgpJbiB0aGVzZSBjYXNlcywgaXQg
d2lsbCBhcHBlbmQgYSAid2FpdCBqb2IiIGludG8gaXRzIG93biBsaXN0LCB3aGljaAp3aWxsIGRv
IChhKSBub3RoaW5nIGlmIHRoZSBsaXN0IGlzIG5vdCBlbXB0eSBvciBpdCBkb2Vzbid0IGhhdmUg
dG8gd2FpdAphbnkgbG9uZ2VyIG9yIChiKSB3YWl0IChpbiB0aGUgc2FtZSB3YWtlLXF1ZXVlIHVz
ZWQgYnkgS1ZNKSB1bnRpbCBpdAppcyBraWNrZWQuIEl0IHNob3VsZCBiZSBPSyBpZiB0aGUgcmVj
ZWl2aW5nIHdvcmtlciBhcHBlbmRzIGEgbmV3IGpvYiBpbgp0aGUgc2FtZSB0aW1lLgoKU2lnbmVk
LW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGlu
Y2x1ZGUvbGludXgvc3dhaXQuaCB8IDExICsrKysrKwogdmlydC9rdm0va3ZtaS5jICAgICAgIHwg
ODAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdmlydC9rdm0v
a3ZtaV9pbnQuaCAgIHwgIDIgKysKIDMgZmlsZXMgY2hhbmdlZCwgOTMgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc3dhaXQuaCBiL2luY2x1ZGUvbGludXgvc3dhaXQu
aAppbmRleCA3M2UwNmU5OTg2ZDQuLjI0ODY2MjVlN2ZiNCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9s
aW51eC9zd2FpdC5oCisrKyBiL2luY2x1ZGUvbGludXgvc3dhaXQuaApAQCAtMjk3LDQgKzI5Nywx
NSBAQCBkbyB7CQkJCQkJCQkJXAogCV9fcmV0OwkJCQkJCQkJXAogfSkKIAorI2RlZmluZSBfX3N3
YWl0X2V2ZW50X2tpbGxhYmxlKHdxLCBjb25kaXRpb24pCQkJCVwKKwlfX19zd2FpdF9ldmVudCh3
cSwgY29uZGl0aW9uLCBUQVNLX0tJTExBQkxFLCAwLAlzY2hlZHVsZSgpKQlcCisKKyNkZWZpbmUg
c3dhaXRfZXZlbnRfa2lsbGFibGUod3EsIGNvbmRpdGlvbikJCQkJXAorKHsJCQkJCQkJCQlcCisJ
aW50IF9fcmV0ID0gMDsJCQkJCQkJXAorCWlmICghKGNvbmRpdGlvbikpCQkJCQkJXAorCQlfX3Jl
dCA9IF9fc3dhaXRfZXZlbnRfa2lsbGFibGUod3EsIGNvbmRpdGlvbik7CQlcCisJX19yZXQ7CQkJ
CQkJCQlcCit9KQorCiAjZW5kaWYgLyogX0xJTlVYX1NXQUlUX0ggKi8KZGlmZiAtLWdpdCBhL3Zp
cnQva3ZtL2t2bWkuYyBiL3ZpcnQva3ZtL2t2bWkuYwppbmRleCAwN2ViZDFjNjI5YjAuLjNjODg0
ZGMwZTM4YyAxMDA2NDQKLS0tIGEvdmlydC9rdm0va3ZtaS5jCisrKyBiL3ZpcnQva3ZtL2t2bWku
YwpAQCAtMTM1LDYgKzEzNSwxOSBAQCBzdGF0aWMgdm9pZCBrdm1pX2ZyZWVfam9iKHN0cnVjdCBr
dm1pX2pvYiAqam9iKQogCWttZW1fY2FjaGVfZnJlZShqb2JfY2FjaGUsIGpvYik7CiB9CiAKK3N0
YXRpYyBzdHJ1Y3Qga3ZtaV9qb2IgKmt2bWlfcHVsbF9qb2Ioc3RydWN0IGt2bWlfdmNwdSAqaXZj
cHUpCit7CisJc3RydWN0IGt2bWlfam9iICpqb2IgPSBOVUxMOworCisJc3Bpbl9sb2NrKCZpdmNw
dS0+am9iX2xvY2spOworCWpvYiA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmaXZjcHUtPmpv
Yl9saXN0LCB0eXBlb2YoKmpvYiksIGxpbmspOworCWlmIChqb2IpCisJCWxpc3RfZGVsKCZqb2It
PmxpbmspOworCXNwaW5fdW5sb2NrKCZpdmNwdS0+am9iX2xvY2spOworCisJcmV0dXJuIGpvYjsK
K30KKwogc3RhdGljIGJvb2wgYWxsb2NfaXZjcHUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogewog
CXN0cnVjdCBrdm1pX3ZjcHUgKml2Y3B1OwpAQCAtNDk2LDYgKzUwOSw3MyBAQCB2b2lkIGt2bWlf
ZGVzdHJveV92bShzdHJ1Y3Qga3ZtICprdm0pCiAJd2FpdF9mb3JfY29tcGxldGlvbl9raWxsYWJs
ZSgma3ZtLT5rdm1pX2NvbXBsZXRlZCk7CiB9CiAKK3ZvaWQga3ZtaV9ydW5fam9icyhzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpCit7CisJc3RydWN0IGt2bWlfdmNwdSAqaXZjcHUgPSBJVkNQVSh2Y3B1
KTsKKwlzdHJ1Y3Qga3ZtaV9qb2IgKmpvYjsKKworCXdoaWxlICgoam9iID0ga3ZtaV9wdWxsX2pv
YihpdmNwdSkpKSB7CisJCWpvYi0+ZmN0KHZjcHUsIGpvYi0+Y3R4KTsKKwkJa3ZtaV9mcmVlX2pv
Yihqb2IpOworCX0KK30KKworc3RhdGljIGJvb2wgZG9uZV93YWl0aW5nKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSkKK3sKKwlzdHJ1Y3Qga3ZtaV92Y3B1ICppdmNwdSA9IElWQ1BVKHZjcHUpOworCisJ
cmV0dXJuICFsaXN0X2VtcHR5KCZpdmNwdS0+am9iX2xpc3QpOworfQorCitzdGF0aWMgdm9pZCBr
dm1pX2pvYl93YWl0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdm9pZCAqY3R4KQoreworCXN0cnVj
dCBzd2FpdF9xdWV1ZV9oZWFkICp3cSA9IGt2bV9hcmNoX3ZjcHVfd3EodmNwdSk7CisJc3RydWN0
IGt2bWlfdmNwdSAqaXZjcHUgPSBJVkNQVSh2Y3B1KTsKKwlpbnQgZXJyOworCisJZXJyID0gc3dh
aXRfZXZlbnRfa2lsbGFibGUoKndxLCBkb25lX3dhaXRpbmcodmNwdSkpOworCisJaWYgKGVycikK
KwkJaXZjcHUtPmtpbGxlZCA9IHRydWU7Cit9CisKK2ludCBrdm1pX3J1bl9qb2JzX2FuZF93YWl0
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlzdHJ1Y3Qga3ZtaV92Y3B1ICppdmNwdSA9IElW
Q1BVKHZjcHUpOworCWludCBlcnIgPSAwOworCisJZm9yICg7OykgeworCQlrdm1pX3J1bl9qb2Jz
KHZjcHUpOworCisJCWlmIChpdmNwdS0+a2lsbGVkKSB7CisJCQllcnIgPSAtMTsKKwkJCWJyZWFr
OworCQl9CisKKwkJa3ZtaV9hZGRfam9iKHZjcHUsIGt2bWlfam9iX3dhaXQsIE5VTEwsIE5VTEwp
OworCX0KKworCXJldHVybiBlcnI7Cit9CisKK3ZvaWQga3ZtaV9oYW5kbGVfcmVxdWVzdHMoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCXN0cnVjdCBrdm1pICppa3ZtOworCisJaWt2bSA9IGt2
bWlfZ2V0KHZjcHUtPmt2bSk7CisJaWYgKCFpa3ZtKQorCQlyZXR1cm47CisKKwlmb3IgKDs7KSB7
CisJCWludCBlcnIgPSBrdm1pX3J1bl9qb2JzX2FuZF93YWl0KHZjcHUpOworCisJCWlmIChlcnIp
CisJCQlicmVhazsKKwl9CisKKwlrdm1pX3B1dCh2Y3B1LT5rdm0pOworfQorCiBpbnQga3ZtaV9j
bWRfY29udHJvbF92bV9ldmVudHMoc3RydWN0IGt2bWkgKmlrdm0sIHVuc2lnbmVkIGludCBldmVu
dF9pZCwKIAkJCSAgICAgICBib29sIGVuYWJsZSkKIHsKZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2t2
bWlfaW50LmggYi92aXJ0L2t2bS9rdm1pX2ludC5oCmluZGV4IDk3ZjkxYTU2ODA5Ni4uNDc0MThl
OWE4NmY2IDEwMDY0NAotLS0gYS92aXJ0L2t2bS9rdm1pX2ludC5oCisrKyBiL3ZpcnQva3ZtL2t2
bWlfaW50LmgKQEAgLTg1LDYgKzg1LDggQEAgc3RydWN0IGt2bWlfam9iIHsKIHN0cnVjdCBrdm1p
X3ZjcHUgewogCXN0cnVjdCBsaXN0X2hlYWQgam9iX2xpc3Q7CiAJc3BpbmxvY2tfdCBqb2JfbG9j
azsKKworCWJvb2wga2lsbGVkOwogfTsKIAogI2RlZmluZSBJS1ZNKGt2bSkgKChzdHJ1Y3Qga3Zt
aSAqKSgoa3ZtKS0+a3ZtaSkpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
