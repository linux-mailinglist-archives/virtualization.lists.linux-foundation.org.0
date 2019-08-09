Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB9088207
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 20:10:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BAA8CD7C;
	Fri,  9 Aug 2019 18:09:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B0F2CD09
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:09:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C105A8A8
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:09:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	6978F305D3D3; Fri,  9 Aug 2019 19:00:56 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id D8593305B7A3;
	Fri,  9 Aug 2019 19:00:55 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 12/92] kvm: introspection: add a jobs list to every
	introspected vCPU
Date: Fri,  9 Aug 2019 18:59:27 +0300
Message-Id: <20190809160047.8319-13-alazar@bitdefender.com>
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

RXZlcnkgdkNQVSBoYXMgYSBsb2NrLXByb3RlY3RlZCBsaXN0IGluIHdoaWNoIChtb3N0bHkpIHRo
ZSByZWNlaXZpbmcKd29ya2VyIHBsYWNlcyB0aGUgam9icyB0byBiZSBkb25lIGJ5IHRoZSB2Q1BV
IG9uY2UgaXQgaXMga2lja2VkCihLVk1fUkVRX0lOVFJPU1BFQ1RJT04pIG91dCBvZiBndWVzdC4K
CkEgam9iIGlzIGRlZmluZWQgYnkgYSAiZG8iIGZ1bmN0aW9uLCBhIHBvaW50ZXIgKGNvbnRleHQp
IGFuZCBhICJmcmVlIgpmdW5jdGlvbi4KCkNvLWRldmVsb3BlZC1ieTogTmljdciZb3IgQ8OuyJt1
IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IE5pY3XImW9yIEPDrsibdSA8
bmNpdHVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFs
YXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aCB8ICAgMSArCiB2aXJ0L2t2bS9rdm1pLmMgICAgICAgICAgICAgICAgIHwgMTAyICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystCiB2aXJ0L2t2bS9rdm1pX2ludC5oICAgICAgICAgICAg
IHwgICA5ICsrKwogMyBmaWxlcyBjaGFuZ2VkLCAxMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNo
L3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCmluZGV4IDE4MDM3MzM2MGUzNC4uNjdlZDkzNGNh
MTI0IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCisrKyBiL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTc4LDYgKzc4LDcgQEAKICNkZWZpbmUg
S1ZNX1JFUV9IVl9TVElNRVIJCUtWTV9BUkNIX1JFUSgyMikKICNkZWZpbmUgS1ZNX1JFUV9MT0FE
X0VPSV9FWElUTUFQCUtWTV9BUkNIX1JFUSgyMykKICNkZWZpbmUgS1ZNX1JFUV9HRVRfVk1DUzEy
X1BBR0VTCUtWTV9BUkNIX1JFUSgyNCkKKyNkZWZpbmUgS1ZNX1JFUV9JTlRST1NQRUNUSU9OCQlL
Vk1fQVJDSF9SRVEoMjUpCiAKICNkZWZpbmUgQ1IwX1JFU0VSVkVEX0JJVFMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKIAkofih1bnNpZ25lZCBsb25nKShY
ODZfQ1IwX1BFIHwgWDg2X0NSMF9NUCB8IFg4Nl9DUjBfRU0gfCBYODZfQ1IwX1RTIFwKZGlmZiAt
LWdpdCBhL3ZpcnQva3ZtL2t2bWkuYyBiL3ZpcnQva3ZtL2t2bWkuYwppbmRleCA4NjA1NzQwMzky
MjEuLjA3ZWJkMWM2MjliMCAxMDA2NDQKLS0tIGEvdmlydC9rdm0va3ZtaS5jCisrKyBiL3ZpcnQv
a3ZtL2t2bWkuYwpAQCAtMTEsNiArMTEsOSBAQAogI2luY2x1ZGUgPGxpbnV4L2JpdG1hcC5oPgog
CiBzdGF0aWMgc3RydWN0IGttZW1fY2FjaGUgKm1zZ19jYWNoZTsKK3N0YXRpYyBzdHJ1Y3Qga21l
bV9jYWNoZSAqam9iX2NhY2hlOworCitzdGF0aWMgdm9pZCBrdm1pX2Fib3J0X2V2ZW50cyhzdHJ1
Y3Qga3ZtICprdm0pOwogCiB2b2lkICprdm1pX21zZ19hbGxvYyh2b2lkKQogewpAQCAtMzQsMTQg
KzM3LDE5IEBAIHN0YXRpYyB2b2lkIGt2bWlfY2FjaGVfZGVzdHJveSh2b2lkKQogewogCWttZW1f
Y2FjaGVfZGVzdHJveShtc2dfY2FjaGUpOwogCW1zZ19jYWNoZSA9IE5VTEw7CisJa21lbV9jYWNo
ZV9kZXN0cm95KGpvYl9jYWNoZSk7CisJam9iX2NhY2hlID0gTlVMTDsKIH0KIAogc3RhdGljIGlu
dCBrdm1pX2NhY2hlX2NyZWF0ZSh2b2lkKQogeworCWpvYl9jYWNoZSA9IGttZW1fY2FjaGVfY3Jl
YXRlKCJrdm1pX2pvYiIsCisJCQkJICAgICAgc2l6ZW9mKHN0cnVjdCBrdm1pX2pvYiksCisJCQkJ
ICAgICAgMCwgU0xBQl9BQ0NPVU5ULCBOVUxMKTsKIAltc2dfY2FjaGUgPSBrbWVtX2NhY2hlX2Ny
ZWF0ZSgia3ZtaV9tc2ciLCBLVk1JX01TR19TSVpFX0FMTE9DLAogCQkJCSAgICAgIDQwOTYsIFNM
QUJfQUNDT1VOVCwgTlVMTCk7CiAKLQlpZiAoIW1zZ19jYWNoZSkgeworCWlmICghbXNnX2NhY2hl
IHx8ICFqb2JfY2FjaGUpIHsKIAkJa3ZtaV9jYWNoZV9kZXN0cm95KCk7CiAKIAkJcmV0dXJuIC0x
OwpAQCAtODAsNiArODgsNTMgQEAgc3RhdGljIGJvb2wgYWxsb2Nfa3ZtaShzdHJ1Y3Qga3ZtICpr
dm0sIGNvbnN0IHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqcWVtdSkKIAlyZXR1cm4gdHJ1ZTsK
IH0KIAorc3RhdGljIGludCBfX2t2bWlfYWRkX2pvYihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCisJ
CQkgIHZvaWQgKCpmY3QpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdm9pZCAqY3R4KSwKKwkJCSAg
dm9pZCAqY3R4LCB2b2lkICgqZnJlZV9mY3QpKHZvaWQgKmN0eCkpCit7CisJc3RydWN0IGt2bWlf
dmNwdSAqaXZjcHUgPSBJVkNQVSh2Y3B1KTsKKwlzdHJ1Y3Qga3ZtaV9qb2IgKmpvYjsKKworCWpv
YiA9IGttZW1fY2FjaGVfemFsbG9jKGpvYl9jYWNoZSwgR0ZQX0tFUk5FTCk7CisJaWYgKHVubGlr
ZWx5KCFqb2IpKQorCQlyZXR1cm4gLUVOT01FTTsKKworCUlOSVRfTElTVF9IRUFEKCZqb2ItPmxp
bmspOworCWpvYi0+ZmN0ID0gZmN0OworCWpvYi0+Y3R4ID0gY3R4OworCWpvYi0+ZnJlZV9mY3Qg
PSBmcmVlX2ZjdDsKKworCXNwaW5fbG9jaygmaXZjcHUtPmpvYl9sb2NrKTsKKwlsaXN0X2FkZF90
YWlsKCZqb2ItPmxpbmssICZpdmNwdS0+am9iX2xpc3QpOworCXNwaW5fdW5sb2NrKCZpdmNwdS0+
am9iX2xvY2spOworCisJcmV0dXJuIDA7Cit9CisKK2ludCBrdm1pX2FkZF9qb2Ioc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LAorCQkgdm9pZCAoKmZjdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB2b2lk
ICpjdHgpLAorCQkgdm9pZCAqY3R4LCB2b2lkICgqZnJlZV9mY3QpKHZvaWQgKmN0eCkpCit7CisJ
aW50IGVycjsKKworCWVyciA9IF9fa3ZtaV9hZGRfam9iKHZjcHUsIGZjdCwgY3R4LCBmcmVlX2Zj
dCk7CisKKwlpZiAoIWVycikgeworCQlrdm1fbWFrZV9yZXF1ZXN0KEtWTV9SRVFfSU5UUk9TUEVD
VElPTiwgdmNwdSk7CisJCWt2bV92Y3B1X2tpY2sodmNwdSk7CisJfQorCisJcmV0dXJuIGVycjsK
K30KKworc3RhdGljIHZvaWQga3ZtaV9mcmVlX2pvYihzdHJ1Y3Qga3ZtaV9qb2IgKmpvYikKK3sK
KwlpZiAoam9iLT5mcmVlX2ZjdCkKKwkJam9iLT5mcmVlX2ZjdChqb2ItPmN0eCk7CisKKwlrbWVt
X2NhY2hlX2ZyZWUoam9iX2NhY2hlLCBqb2IpOworfQorCiBzdGF0aWMgYm9vbCBhbGxvY19pdmNw
dShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiB7CiAJc3RydWN0IGt2bWlfdmNwdSAqaXZjcHU7CkBA
IC04OCw2ICsxNDMsOSBAQCBzdGF0aWMgYm9vbCBhbGxvY19pdmNwdShzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpCiAJaWYgKCFpdmNwdSkKIAkJcmV0dXJuIGZhbHNlOwogCisJSU5JVF9MSVNUX0hFQUQo
Jml2Y3B1LT5qb2JfbGlzdCk7CisJc3Bpbl9sb2NrX2luaXQoJml2Y3B1LT5qb2JfbG9jayk7CisK
IAl2Y3B1LT5rdm1pID0gaXZjcHU7CiAKIAlyZXR1cm4gdHJ1ZTsKQEAgLTEwMSw2ICsxNTksMjcg
QEAgc3RydWN0IGt2bWkgKiBfX211c3RfY2hlY2sga3ZtaV9nZXQoc3RydWN0IGt2bSAqa3ZtKQog
CXJldHVybiBOVUxMOwogfQogCitzdGF0aWMgdm9pZCBrdm1pX2NsZWFyX3ZjcHVfam9icyhzdHJ1
Y3Qga3ZtICprdm0pCit7CisJaW50IGk7CisJc3RydWN0IGt2bV92Y3B1ICp2Y3B1OworCXN0cnVj
dCBrdm1pX2pvYiAqY3VyLCAqbmV4dDsKKworCWt2bV9mb3JfZWFjaF92Y3B1KGksIHZjcHUsIGt2
bSkgeworCQlzdHJ1Y3Qga3ZtaV92Y3B1ICppdmNwdSA9IElWQ1BVKHZjcHUpOworCisJCWlmICgh
aXZjcHUpCisJCQljb250aW51ZTsKKworCQlzcGluX2xvY2soJml2Y3B1LT5qb2JfbG9jayk7CisJ
CWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShjdXIsIG5leHQsICZpdmNwdS0+am9iX2xpc3QsIGxp
bmspIHsKKwkJCWxpc3RfZGVsKCZjdXItPmxpbmspOworCQkJa3ZtaV9mcmVlX2pvYihjdXIpOwor
CQl9CisJCXNwaW5fdW5sb2NrKCZpdmNwdS0+am9iX2xvY2spOworCX0KK30KKwogc3RhdGljIHZv
aWQga3ZtaV9kZXN0cm95KHN0cnVjdCBrdm0gKmt2bSkKIHsKIAlzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHU7CkBAIC0xMTgsNiArMTk3LDcgQEAgc3RhdGljIHZvaWQga3ZtaV9kZXN0cm95KHN0cnVjdCBr
dm0gKmt2bSkKIHN0YXRpYyB2b2lkIGt2bWlfcmVsZWFzZShzdHJ1Y3Qga3ZtICprdm0pCiB7CiAJ
a3ZtaV9zb2NrX3B1dChJS1ZNKGt2bSkpOworCWt2bWlfY2xlYXJfdmNwdV9qb2JzKGt2bSk7CiAJ
a3ZtaV9kZXN0cm95KGt2bSk7CiAKIAljb21wbGV0ZSgma3ZtLT5rdm1pX2NvbXBsZXRlZCk7CkBA
IC0xNzksNiArMjU5LDEzIEBAIHN0YXRpYyB2b2lkIGt2bWlfZW5kX2ludHJvc3BlY3Rpb24oc3Ry
dWN0IGt2bWkgKmlrdm0pCiAJLyogU2lnbmFsIFFFTVUgd2hpY2ggaXMgd2FpdGluZyBmb3IgUE9M
TEhVUC4gKi8KIAlrdm1pX3NvY2tfc2h1dGRvd24oaWt2bSk7CiAKKwkvKgorCSAqIFRyaWdnZXIg
YWxsIHRoZSBWQ1BVcyBvdXQgb2Ygd2FpdGluZyBmb3IgcmVwbGllcy4gQWx0aG91Z2ggdGhlCisJ
ICogaW50cm9zcGVjdGlvbiBpcyBzdGlsbCBlbmFibGVkLCBzZW5kaW5nIGFkZGl0aW9uYWwgZXZl
bnRzIHdpbGwKKwkgKiBmYWlsIGJlY2F1c2UgdGhlIHNvY2tldCBpcyBzaHV0IGRvd24uIFdhaXRp
bmcgd2lsbCBub3QgYmUgcG9zc2libGUuCisJICovCisJa3ZtaV9hYm9ydF9ldmVudHMoa3ZtKTsK
KwogCS8qCiAJICogQXQgdGhpcyBtb21lbnQgdGhlIHNvY2tldCBpcyBzaHV0IGRvd24sIG5vIG1v
cmUgY29tbWFuZHMgd2lsbCBjb21lCiAJICogZnJvbSB0aGUgaW50cm9zcGVjdG9yLCBhbmQgdGhl
IG9ubHkgd2F5IGludG8gdGhlIGludHJvc3BlY3Rpb24gaXMKQEAgLTQyMCw2ICs1MDcsMTkgQEAg
aW50IGt2bWlfY21kX2NvbnRyb2xfdm1fZXZlbnRzKHN0cnVjdCBrdm1pICppa3ZtLCB1bnNpZ25l
ZCBpbnQgZXZlbnRfaWQsCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyB2b2lkIGt2bWlfam9iX2Fi
b3J0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdm9pZCAqY3R4KQoreworfQorCitzdGF0aWMgdm9p
ZCBrdm1pX2Fib3J0X2V2ZW50cyhzdHJ1Y3Qga3ZtICprdm0pCit7CisJaW50IGk7CisJc3RydWN0
IGt2bV92Y3B1ICp2Y3B1OworCisJa3ZtX2Zvcl9lYWNoX3ZjcHUoaSwgdmNwdSwga3ZtKQorCQlr
dm1pX2FkZF9qb2IodmNwdSwga3ZtaV9qb2JfYWJvcnQsIE5VTEwsIE5VTEwpOworfQorCiBpbnQg
a3ZtaV9pb2N0bF91bmhvb2soc3RydWN0IGt2bSAqa3ZtLCBib29sIGZvcmNlX3Jlc2V0KQogewog
CXN0cnVjdCBrdm1pICppa3ZtOwpkaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtaV9pbnQuaCBiL3Zp
cnQva3ZtL2t2bWlfaW50LmgKaW5kZXggODczOWEzNDM1ODkzLi45N2Y5MWE1NjgwOTYgMTAwNjQ0
Ci0tLSBhL3ZpcnQva3ZtL2t2bWlfaW50LmgKKysrIGIvdmlydC9rdm0va3ZtaV9pbnQuaApAQCAt
NzUsNyArNzUsMTYgQEAKIAogI2RlZmluZSBLVk1JX05VTV9DT01NQU5EUyBLVk1JX05FWFRfQVZB
SUxBQkxFX0NPTU1BTkQKIAorc3RydWN0IGt2bWlfam9iIHsKKwlzdHJ1Y3QgbGlzdF9oZWFkIGxp
bms7CisJdm9pZCAqY3R4OworCXZvaWQgKCpmY3QpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdm9p
ZCAqY3R4KTsKKwl2b2lkICgqZnJlZV9mY3QpKHZvaWQgKmN0eCk7Cit9OworCiBzdHJ1Y3Qga3Zt
aV92Y3B1IHsKKwlzdHJ1Y3QgbGlzdF9oZWFkIGpvYl9saXN0OworCXNwaW5sb2NrX3Qgam9iX2xv
Y2s7CiB9OwogCiAjZGVmaW5lIElLVk0oa3ZtKSAoKHN0cnVjdCBrdm1pICopKChrdm0pLT5rdm1p
KSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
