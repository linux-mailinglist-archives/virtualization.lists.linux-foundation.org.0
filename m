Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EF12A1978C3
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:20:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8799486A22;
	Mon, 30 Mar 2020 10:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LGyswbHG2yDc; Mon, 30 Mar 2020 10:19:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 03D2C86A3C;
	Mon, 30 Mar 2020 10:19:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF97CC07FF;
	Mon, 30 Mar 2020 10:19:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4A3DC07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A4DBA230F3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9VwD0N96m9gW
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id 4FD612012F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:48 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 0054F307503D; Mon, 30 Mar 2020 13:12:55 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id DC092305B7A2;
 Mon, 30 Mar 2020 13:12:54 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 40/81] KVM: introspection: add permission access ioctls
Date: Mon, 30 Mar 2020 13:12:27 +0300
Message-Id: <20200330101308.21702-41-alazar@bitdefender.com>
In-Reply-To: <20200330101308.21702-1-alazar@bitdefender.com>
References: <20200330101308.21702-1-alazar@bitdefender.com>
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

S1ZNX0lOVFJPU1BFQ1RJT05fQ09NTUFORCBhbmQgS1ZNX0lOVFJPU1BFQ1RJT05fRVZFTlRTIGlv
Y3RscwphcmUgdXNlZCBieSB1c2Vyc3BhY2UgdG8gYWxsb3cgYWNjZXNzIGZvciBzcGVjaWZpYyAo
b3IgYWxsKQppbnRyb3NwZWN0aW9uIGNvbW1hbmRzIGFuZCBldmVudHMuCgpCeSBkZWZhdWx0LCBh
bGwgZXZlbnRzIGFuZCBhbG1vc3QgYWxsIGNvbW1hbmRzIGFyZSBkaXNhbGxvd2VkLgpTb21lIGNv
bW1hbmRzLCB0aG9zZSBxdWVyeWluZyB0aGUgaW50cm9zcGVjdGlvbiBjYXBhYmlsaXRpZXMsCmFy
ZSBhbHdheXMgYWxsb3dlZC4KClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFy
QGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QgICAg
ICAgICAgICAgICAgfCAgNzIgKysrKysrKysrKysrKwogaW5jbHVkZS9saW51eC9rdm1pX2hvc3Qu
aCAgICAgICAgICAgICAgICAgICAgIHwgICA3ICsrCiBpbmNsdWRlL3VhcGkvbGludXgva3ZtLmgg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDggKysKIGluY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgg
ICAgICAgICAgICAgICAgICAgICB8ICAgOCArKwogLi4uL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94
ODZfNjQva3ZtaV90ZXN0LmMgIHwgIDI4ICsrKysrCiB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2
bWkuYyAgICAgICAgICAgICAgICAgfCAxMDEgKysrKysrKysrKysrKysrKysrCiB2aXJ0L2t2bS9r
dm1fbWFpbi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKysKIDcgZmlsZXMgY2hh
bmdlZCwgMjMwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3ZpcnQv
a3ZtL2FwaS5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QKaW5kZXggM2ZmNDJl
NWU2ZDYzLi40ZDgxYTJmMmY4ZjcgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0v
YXBpLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QKQEAgLTQ2OTksNiAr
NDY5OSw3OCBAQCB0aGUgS1ZNX0NIRUNLX0VYVEVOU0lPTiBpb2N0bCgpIGF0IHJ1bi10aW1lLgog
VGhpcyBpb2N0bCBpcyB1c2VkIHRvIGZyZWUgYWxsIGludHJvc3BlY3Rpb24gc3RydWN0dXJlcwog
cmVsYXRlZCB0byB0aGlzIFZNLgogCitFcnJvcnM6CisKKyAgPT09PT09ICAgICA9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQorICBFRkFVTFQgICAgIHRoZSBpbnRyb3NwZWN0aW9uIGlz
IG5vdCBlbmFibGVkCisgID09PT09PSAgICAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0KKworNC4xMjcgS1ZNX0lOVFJPU1BFQ1RJT05fQ09NTUFORAorLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQorCis6Q2FwYWJpbGl0eTogS1ZNX0NBUF9JTlRST1NQRUNUSU9OCis6QXJj
aGl0ZWN0dXJlczogeDg2Cis6VHlwZTogdm0gaW9jdGwKKzpQYXJhbWV0ZXJzOiBzdHJ1Y3Qga3Zt
X2ludHJvc3BlY3Rpb25fZmVhdHVyZSAoaW4pCis6UmV0dXJuczogMCBvbiBzdWNjZXNzLCBhIG5l
Z2F0aXZlIHZhbHVlIG9uIGVycm9yCisKK0Vycm9yczoKKworICA9PT09PT0gICAgID09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KKyAgRUZBVUxU
ICAgICB0aGUgaW50cm9zcGVjdGlvbiBpcyBub3QgZW5hYmxlZAorICBFSU5WQUwgICAgIHRoZSBj
b21tYW5kIGlzIHVua25vd24KKyAgRVBFUk0gICAgICB0aGUgY29tbWFuZCBjYW4ndCBiZSBkaXNh
bGxvd2VkIChlLmcuIEtWTUlfR0VUX1ZFUlNJT04pCisgID09PT09PSAgICAgPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQorCitUaGlzIGlvY3Rs
IGlzIHVzZWQgdG8gYWxsb3cgb3IgZGlzYWxsb3cgaW50cm9zcGVjdGlvbiBjb21tYW5kcworZm9y
IHRoZSBjdXJyZW50IFZNLiBCeSBkZWZhdWx0LCBhbG1vc3QgYWxsIGNvbW1hbmRzIGFyZSBkaXNh
bGxvd2VkCitleGNlcHQgZm9yIHRob3NlIHVzZWQgdG8gcXVlcnkgdGhlIEFQSS4KKworOjoKKwor
ICBzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb25fZmVhdHVyZSB7CisJX191MzIgYWxsb3c7CisJX19z
MzIgaWQ7CisgIH07CisKK0lmIGFsbG93IGlzIDEsIHRoZSBjb21tYW5kIHNwZWNpZmllZCBieSBp
ZCBpcyBhbGxvd2VkLiBJZiBhbGxvdyBpcyAwLAordGhlIGNvbW1hbmQgaXMgZGlzYWxsb3dlZC4K
KworVW5sZXNzIHNldCB0byAtMSAobWVhbmluZyBhbGwgY29tbWFuZHMpLCBpZCBtdXN0IGJlIGEg
Y29tbWFuZCBJRAorKGUuZy4gS1ZNSV9HRVRfVkVSU0lPTikKKworNC4xMjggS1ZNX0lOVFJPU1BF
Q1RJT05fRVZFTlQKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisKKzpDYXBhYmlsaXR5
OiBLVk1fQ0FQX0lOVFJPU1BFQ1RJT04KKzpBcmNoaXRlY3R1cmVzOiB4ODYKKzpUeXBlOiB2bSBp
b2N0bAorOlBhcmFtZXRlcnM6IHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbl9mZWF0dXJlIChpbikK
KzpSZXR1cm5zOiAwIG9uIHN1Y2Nlc3MsIGEgbmVnYXRpdmUgdmFsdWUgb24gZXJyb3IKKworRXJy
b3JzOgorCisgID09PT09PSAgICAgPT09PT09PT09PT09PT09PT09PT0KKyAgRUZBVUxUICAgICB0
aGUgaW50cm9zcGVjdGlvbiBpcyBub3QgZW5hYmxlZAorICBFSU5WQUwgICAgIHRoZSBldmVudCBp
cyB1bmtub3duCisgID09PT09PSAgICAgPT09PT09PT09PT09PT09PT09PT0KKworVGhpcyBpb2N0
bCBpcyB1c2VkIHRvIGFsbG93IG9yIGRpc2FsbG93IGludHJvc3BlY3Rpb24gZXZlbnRzCitmb3Ig
dGhlIGN1cnJlbnQgVk0uIEJ5IGRlZmF1bHQsIGFsbCBldmVudHMgYXJlIGRpc2FsbG93ZWQuCisK
Kzo6CisKKyAgc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uX2ZlYXR1cmUgeworCV9fdTMyIGFsbG93
OworCV9fczMyIGlkOworICB9OworCitJZiBhbGxvdyBpcyAxLCB0aGUgZXZlbnQgc3BlY2lmaWVk
IGJ5IGlkIGlzIGFsbG93ZWQuIElmIGFsbG93IGlzIDAsCit0aGUgZXZlbnQgaXMgZGlzYWxsb3dl
ZC4KKworVW5sZXNzIHNldCB0byAtMSAobWVhbmluZyBhbGwgZXZlbnQpLCBpZCBtdXN0IGJlIGEg
ZXZlbnQgSUQKKyhlLmcuIEtWTUlfRVZFTlRfVU5IT09LLCBLVk1JX0VWRU5UX0NSLCBldGMuKQor
CiA1LiBUaGUga3ZtX3J1biBzdHJ1Y3R1cmUKID09PT09PT09PT09PT09PT09PT09PT09PQogCmRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bWlfaG9zdC5oIGIvaW5jbHVkZS9saW51eC9rdm1p
X2hvc3QuaAppbmRleCBjOGI5Yzg3ZWNmZjIuLjRlNzdhMDIyN2MwOCAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9saW51eC9rdm1pX2hvc3QuaAorKysgYi9pbmNsdWRlL2xpbnV4L2t2bWlfaG9zdC5oCkBA
IC04LDYgKzgsOCBAQCBzdHJ1Y3Qga3ZtOwogCiAjaW5jbHVkZSA8YXNtL2t2bWlfaG9zdC5oPgog
CisjZGVmaW5lIEtWTUlfTlVNX0NPTU1BTkRTIEtWTUlfTlVNX01FU1NBR0VTCisKIHN0cnVjdCBr
dm1faW50cm9zcGVjdGlvbiB7CiAJc3RydWN0IGt2bV9hcmNoX2ludHJvc3BlY3Rpb24gYXJjaDsK
IAlzdHJ1Y3Qga3ZtICprdm07CkBAIC0xNiw2ICsxOCw5IEBAIHN0cnVjdCBrdm1faW50cm9zcGVj
dGlvbiB7CiAKIAlzdHJ1Y3Qgc29ja2V0ICpzb2NrOwogCXN0cnVjdCB0YXNrX3N0cnVjdCAqcmVj
djsKKworCURFQ0xBUkVfQklUTUFQKGNtZF9hbGxvd19tYXNrLCBLVk1JX05VTV9DT01NQU5EUyk7
CisJREVDTEFSRV9CSVRNQVAoZXZlbnRfYWxsb3dfbWFzaywgS1ZNSV9OVU1fRVZFTlRTKTsKIH07
CiAKICNpZmRlZiBDT05GSUdfS1ZNX0lOVFJPU1BFQ1RJT04KQEAgLTI3LDYgKzMyLDggQEAgdm9p
ZCBrdm1pX2Rlc3Ryb3lfdm0oc3RydWN0IGt2bSAqa3ZtKTsKIAogaW50IGt2bWlfaW9jdGxfaG9v
ayhzdHJ1Y3Qga3ZtICprdm0sIHZvaWQgX191c2VyICphcmdwKTsKIGludCBrdm1pX2lvY3RsX3Vu
aG9vayhzdHJ1Y3Qga3ZtICprdm0pOworaW50IGt2bWlfaW9jdGxfY29tbWFuZChzdHJ1Y3Qga3Zt
ICprdm0sIHZvaWQgX191c2VyICphcmdwKTsKK2ludCBrdm1pX2lvY3RsX2V2ZW50KHN0cnVjdCBr
dm0gKmt2bSwgdm9pZCBfX3VzZXIgKmFyZ3ApOwogCiAjZWxzZQogCmRpZmYgLS1naXQgYS9pbmNs
dWRlL3VhcGkvbGludXgva3ZtLmggYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtLmgKaW5kZXggNmQx
MDc2ZWQ5M2E3Li5kZDRhYjg4ZjAwMTIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9r
dm0uaAorKysgYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtLmgKQEAgLTE1NjgsNiArMTU2OCwxNCBA
QCBzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb25faG9vayB7CiAjZGVmaW5lIEtWTV9JTlRST1NQRUNU
SU9OX0hPT0sgICAgX0lPVyhLVk1JTywgMHhjMywgc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uX2hv
b2spCiAjZGVmaW5lIEtWTV9JTlRST1NQRUNUSU9OX1VOSE9PSyAgX0lPKEtWTUlPLCAweGM0KQog
CitzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb25fZmVhdHVyZSB7CisJX191MzIgYWxsb3c7CisJX19z
MzIgaWQ7Cit9OworCisjZGVmaW5lIEtWTV9JTlRST1NQRUNUSU9OX0NPTU1BTkQgX0lPVyhLVk1J
TywgMHhjNSwgc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uX2ZlYXR1cmUpCisjZGVmaW5lIEtWTV9J
TlRST1NQRUNUSU9OX0VWRU5UICAgX0lPVyhLVk1JTywgMHhjNiwgc3RydWN0IGt2bV9pbnRyb3Nw
ZWN0aW9uX2ZlYXR1cmUpCisKICNkZWZpbmUgS1ZNX0RFVl9BU1NJR05fRU5BQkxFX0lPTU1VCSgx
IDw8IDApCiAjZGVmaW5lIEtWTV9ERVZfQVNTSUdOX1BDSV8yXzMJCSgxIDw8IDEpCiAjZGVmaW5l
IEtWTV9ERVZfQVNTSUdOX01BU0tfSU5UWAkoMSA8PCAyKQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91
YXBpL2xpbnV4L2t2bWkuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgKaW5kZXggMzRkZGE5
MTAxNmRiLi5kN2IxOGZmZWY0ZmEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9rdm1p
LmgKKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaApAQCAtMTAsNCArMTAsMTIgQEAgZW51
bSB7CiAJS1ZNSV9WRVJTSU9OID0gMHgwMDAwMDAwMQogfTsKIAorZW51bSB7CisJS1ZNSV9OVU1f
TUVTU0FHRVMKK307CisKK2VudW0geworCUtWTUlfTlVNX0VWRU5UUworfTsKKwogI2VuZGlmIC8q
IF9VQVBJX19MSU5VWF9LVk1JX0ggKi8KZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0v
eDg2XzY0L2t2bWlfdGVzdC5jCmluZGV4IDEwMGYwNWM1MThhYS4uZDFkMDJlMDY3MzkzIDEwMDY0
NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jCisr
KyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMKQEAgLTMz
LDE1ICszMyw0MyBAQCB2b2lkIHNldHVwX3NvY2tldCh2b2lkKQogCQllcnJubywgc3RyZXJyb3Io
ZXJybm8pKTsKIH0KIAorc3RhdGljIHZvaWQgdG9nZ2xlX2V2ZW50X3Blcm1pc3Npb24oc3RydWN0
IGt2bV92bSAqdm0sIF9fczMyIGlkLCBib29sIGFsbG93KQoreworCXN0cnVjdCBrdm1faW50cm9z
cGVjdGlvbl9mZWF0dXJlIGZlYXQgPSB7CisJCS5hbGxvdyA9IGFsbG93ID8gMSA6IDAsCisJCS5p
ZCA9IGlkCisJfTsKKwlpbnQgcjsKKworCXIgPSBpb2N0bCh2bS0+ZmQsIEtWTV9JTlRST1NQRUNU
SU9OX0VWRU5ULCAmZmVhdCk7CisJVEVTVF9BU1NFUlQociA9PSAwLAorCQkiS1ZNX0lOVFJPU1BF
Q1RJT05fRVZFTlQgZmFpbGVkLCBpZCAlZCwgZXJybm8gJWQgKCVzKVxuIiwKKwkJaWQsIGVycm5v
LCBzdHJlcnJvcihlcnJubykpOworfQorCitzdGF0aWMgdm9pZCBhbGxvd19ldmVudChzdHJ1Y3Qg
a3ZtX3ZtICp2bSwgX19zMzIgZXZlbnRfaWQpCit7CisJdG9nZ2xlX2V2ZW50X3Blcm1pc3Npb24o
dm0sIGV2ZW50X2lkLCB0cnVlKTsKK30KKwogc3RhdGljIHZvaWQgaG9va19pbnRyb3NwZWN0aW9u
KHN0cnVjdCBrdm1fdm0gKnZtKQogeworCV9fczMyIGFsbF9JRHMgPSAtMTsKIAlzdHJ1Y3Qga3Zt
X2ludHJvc3BlY3Rpb25faG9vayBob29rID0gey5mZCA9IEt2bV9zb2NrZXR9OworCXN0cnVjdCBr
dm1faW50cm9zcGVjdGlvbl9mZWF0dXJlIGZlYXQgPSB7LmFsbG93ID0gMSwgLmlkID0gYWxsX0lE
c307CiAJaW50IHI7CiAKIAlyID0gaW9jdGwodm0tPmZkLCBLVk1fSU5UUk9TUEVDVElPTl9IT09L
LCAmaG9vayk7CiAJVEVTVF9BU1NFUlQociA9PSAwLAogCQkiS1ZNX0lOVFJPU1BFQ1RJT05fSE9P
SyBmYWlsZWQsIGVycm5vICVkICglcylcbiIsCiAJCWVycm5vLCBzdHJlcnJvcihlcnJubykpOwor
CisJciA9IGlvY3RsKHZtLT5mZCwgS1ZNX0lOVFJPU1BFQ1RJT05fQ09NTUFORCwgJmZlYXQpOwor
CVRFU1RfQVNTRVJUKHIgPT0gMCwKKwkJIktWTV9JTlRST1NQRUNUSU9OX0NPTU1BTkQgZmFpbGVk
LCBlcnJubyAlZCAoJXMpXG4iLAorCQllcnJubywgc3RyZXJyb3IoZXJybm8pKTsKKworCWFsbG93
X2V2ZW50KHZtLCBhbGxfSURzKTsKIH0KIAogc3RhdGljIHZvaWQgdW5ob29rX2ludHJvc3BlY3Rp
b24oc3RydWN0IGt2bV92bSAqdm0pCmRpZmYgLS1naXQgYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9u
L2t2bWkuYyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jCmluZGV4IGVjZWJiMDBiNDI0
NS4uOTViMDhhNDBkODE0IDEwMDY0NAotLS0gYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWku
YworKysgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYwpAQCAtMTg0LDMgKzE4NCwxMDQg
QEAgdm9pZCBrdm1pX2Rlc3Ryb3lfdm0oc3RydWN0IGt2bSAqa3ZtKQogewogCWt2bWlfdW5ob29r
KGt2bSk7CiB9CisKK3N0YXRpYyBpbnQga3ZtaV9pb2N0bF9nZXRfZmVhdHVyZSh2b2lkIF9fdXNl
ciAqYXJncCwgYm9vbCAqYWxsb3csIGludCAqaWQsCisJCQkJICB1bnNpZ25lZCBpbnQgbmJpdHMp
Cit7CisJc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uX2ZlYXR1cmUgZmVhdDsKKwlpbnQgYWxsX2Jp
dHMgPSAtMTsKKworCWlmIChjb3B5X2Zyb21fdXNlcigmZmVhdCwgYXJncCwgc2l6ZW9mKGZlYXQp
KSkKKwkJcmV0dXJuIC1FRkFVTFQ7CisKKwlpZiAoZmVhdC5pZCA8IDAgJiYgZmVhdC5pZCAhPSBh
bGxfYml0cykKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlpZiAoZmVhdC5pZCA+IDAgJiYgZmVhdC5p
ZCA+PSBuYml0cykKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwkqYWxsb3cgPSBmZWF0LmFsbG93ID09
IDE7CisJKmlkID0gZmVhdC5pZDsKKworCXJldHVybiAwOworfQorCitzdGF0aWMgdm9pZCBrdm1p
X2NvbnRyb2xfYWxsb3dlZF9ldmVudHMoc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pLAor
CQkJCQlpbnQgaWQsIGJvb2wgYWxsb3cpCit7CisJaW50IGFsbF9ldmVudHMgPSAtMTsKKworCWlm
IChhbGxvdykgeworCQlpZiAoaWQgPT0gYWxsX2V2ZW50cykKKwkJCWJpdG1hcF9maWxsKGt2bWkt
PmV2ZW50X2FsbG93X21hc2ssIEtWTUlfTlVNX0VWRU5UUyk7CisJCWVsc2UKKwkJCXNldF9iaXQo
aWQsIGt2bWktPmV2ZW50X2FsbG93X21hc2spOworCX0gZWxzZSB7CisJCWlmIChpZCA9PSBhbGxf
ZXZlbnRzKQorCQkJYml0bWFwX3plcm8oa3ZtaS0+ZXZlbnRfYWxsb3dfbWFzaywgS1ZNSV9OVU1f
RVZFTlRTKTsKKwkJZWxzZQorCQkJY2xlYXJfYml0KGlkLCBrdm1pLT5ldmVudF9hbGxvd19tYXNr
KTsKKwl9Cit9CisKK2ludCBrdm1pX2lvY3RsX2V2ZW50KHN0cnVjdCBrdm0gKmt2bSwgdm9pZCBf
X3VzZXIgKmFyZ3ApCit7CisJc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pOworCWludCBl
cnIsIGlkOworCWJvb2wgYWxsb3c7CisKKwllcnIgPSBrdm1pX2lvY3RsX2dldF9mZWF0dXJlKGFy
Z3AsICZhbGxvdywgJmlkLCBLVk1JX05VTV9FVkVOVFMpOworCWlmIChlcnIpCisJCXJldHVybiBl
cnI7CisKKwltdXRleF9sb2NrKCZrdm0tPmt2bWlfbG9jayk7CisKKwlrdm1pID0gS1ZNSShrdm0p
OworCWlmIChrdm1pKQorCQlrdm1pX2NvbnRyb2xfYWxsb3dlZF9ldmVudHMoa3ZtaSwgaWQsIGFs
bG93KTsKKwllbHNlCisJCWVyciA9IC1FRkFVTFQ7CisKKwltdXRleF91bmxvY2soJmt2bS0+a3Zt
aV9sb2NrKTsKKwlyZXR1cm4gZXJyOworfQorCitzdGF0aWMgdm9pZCBrdm1pX2NvbnRyb2xfYWxs
b3dlZF9jb21tYW5kcyhzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksCisJCQkJCSAgaW50
IGlkLCBib29sIGFsbG93KQoreworCWludCBhbGxfY29tbWFuZHMgPSAtMTsKKworCWlmIChhbGxv
dykgeworCQlpZiAoaWQgPT0gYWxsX2NvbW1hbmRzKQorCQkJYml0bWFwX2ZpbGwoa3ZtaS0+Y21k
X2FsbG93X21hc2ssIEtWTUlfTlVNX0NPTU1BTkRTKTsKKwkJZWxzZQorCQkJc2V0X2JpdChpZCwg
a3ZtaS0+Y21kX2FsbG93X21hc2spOworCX0gZWxzZSB7CisJCWlmIChpZCA9PSBhbGxfY29tbWFu
ZHMpCisJCQliaXRtYXBfemVybyhrdm1pLT5jbWRfYWxsb3dfbWFzaywgS1ZNSV9OVU1fQ09NTUFO
RFMpOworCQllbHNlCisJCQljbGVhcl9iaXQoaWQsIGt2bWktPmNtZF9hbGxvd19tYXNrKTsKKwl9
Cit9CisKK2ludCBrdm1pX2lvY3RsX2NvbW1hbmQoc3RydWN0IGt2bSAqa3ZtLCB2b2lkIF9fdXNl
ciAqYXJncCkKK3sKKwlzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWk7CisJaW50IGVyciwg
aWQ7CisJYm9vbCBhbGxvdzsKKworCWVyciA9IGt2bWlfaW9jdGxfZ2V0X2ZlYXR1cmUoYXJncCwg
JmFsbG93LCAmaWQsIEtWTUlfTlVNX0NPTU1BTkRTKTsKKwlpZiAoZXJyKQorCQlyZXR1cm4gZXJy
OworCisJbXV0ZXhfbG9jaygma3ZtLT5rdm1pX2xvY2spOworCisJa3ZtaSA9IEtWTUkoa3ZtKTsK
KwlpZiAoa3ZtaSkKKwkJa3ZtaV9jb250cm9sX2FsbG93ZWRfY29tbWFuZHMoa3ZtaSwgaWQsIGFs
bG93KTsKKwllbHNlCisJCWVyciA9IC1FRkFVTFQ7CisKKwltdXRleF91bmxvY2soJmt2bS0+a3Zt
aV9sb2NrKTsKKwlyZXR1cm4gZXJyOworfQpkaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4u
YyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKaW5kZXggODI2MzRiZTU2MGU2Li40Y2E4NjI1NTc1YmIg
MTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMKKysrIGIvdmlydC9rdm0va3ZtX21haW4u
YwpAQCAtMzU5MCw2ICszNTkwLDEyIEBAIHN0YXRpYyBsb25nIGt2bV92bV9pb2N0bChzdHJ1Y3Qg
ZmlsZSAqZmlscCwKIAljYXNlIEtWTV9JTlRST1NQRUNUSU9OX1VOSE9PSzoKIAkJciA9IGt2bWlf
aW9jdGxfdW5ob29rKGt2bSk7CiAJCWJyZWFrOworCWNhc2UgS1ZNX0lOVFJPU1BFQ1RJT05fQ09N
TUFORDoKKwkJciA9IGt2bWlfaW9jdGxfY29tbWFuZChrdm0sIGFyZ3ApOworCQlicmVhazsKKwlj
YXNlIEtWTV9JTlRST1NQRUNUSU9OX0VWRU5UOgorCQlyID0ga3ZtaV9pb2N0bF9ldmVudChrdm0s
IGFyZ3ApOworCQlicmVhazsKICNlbmRpZiAvKiBDT05GSUdfS1ZNX0lOVFJPU1BFQ1RJT04gKi8K
IAlkZWZhdWx0OgogCQlyID0ga3ZtX2FyY2hfdm1faW9jdGwoZmlscCwgaW9jdGwsIGFyZyk7Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
