Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 419AF155E01
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:26:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 01DF9869D2;
	Fri,  7 Feb 2020 18:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xjZnF3hi4XlC; Fri,  7 Feb 2020 18:26:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9B4CD86A29;
	Fri,  7 Feb 2020 18:26:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 827D1C013E;
	Fri,  7 Feb 2020 18:26:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 734DFC1D85
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6E2C687F79
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YpXs8khwxVsf
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EB6CB87F8E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 3D989305D341; Fri,  7 Feb 2020 20:16:40 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 1F9393052071;
 Fri,  7 Feb 2020 20:16:40 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 35/78] KVM: x86: disable gpa_available optimization for
 fetch and page-walk NPF/EPT violations
Date: Fri,  7 Feb 2020 20:15:53 +0200
Message-Id: <20200207181636.1065-36-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Mircea=20C=C3=AErjaliu?= <mcirjaliu@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
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

RnJvbTogTWlyY2VhIEPDrnJqYWxpdSA8bWNpcmphbGl1QGJpdGRlZmVuZGVyLmNvbT4KClRoaXMg
Y2hhbmdlIGlzIG5lZWRlZCBiZWNhdXNlIHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgY2FuIHdyaXRl
LXByb3RlY3QKZ3Vlc3QgcGFnZSB0YWJsZXMsIGV4ZWMtcHJvdGVjdCBoZWFwL3N0YWNrIHBhZ2Vz
IGFuZCBsZXQgS1ZNIGVtdWxhdGUKdGhlIGluc3RydWN0aW9uIHRoYXQgY2F1c2VkIHRoZXNlIHZp
b2xhdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBNaXJjZWEgQ8OucmphbGl1IDxtY2lyamFsaXVAYml0
ZGVmZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRk
ZWZlbmRlci5jb20+Ci0tLQogYXJjaC94ODYva3ZtL21tdS9tbXUuYyB8IDkgKysrKysrKy0tCiAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2FyY2gveDg2L2t2bS9tbXUvbW11LmMgYi9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCmluZGV4
IDVmMGRkYzZiNjdkZS4uZDI4Yjc0MjVjNGYxIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vbW11
L21tdS5jCisrKyBiL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKQEAgLTU2MzYsOCArNTYzNiwxMyBA
QCBpbnQga3ZtX21tdV9wYWdlX2ZhdWx0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3ZhX3QgY3Iy
LCB1NjQgZXJyb3JfY29kZSwKIAlpbnQgciwgZW11bGF0aW9uX3R5cGUgPSAwOwogCWJvb2wgZGly
ZWN0ID0gdmNwdS0+YXJjaC5tbXUtPmRpcmVjdF9tYXA7CiAKLQkvKiBXaXRoIHNoYWRvdyBwYWdl
IHRhYmxlcywgZmF1bHRfYWRkcmVzcyBjb250YWlucyBhIEdWQSBvciBuR1BBLiAgKi8KLQlpZiAo
dmNwdS0+YXJjaC5tbXUtPmRpcmVjdF9tYXApIHsKKwkvKgorCSAqIFdpdGggc2hhZG93IHBhZ2Ug
dGFibGVzLCBmYXVsdF9hZGRyZXNzIGNvbnRhaW5zIGEgR1ZBIG9yIG5HUEEuCisJICogT24gYSBm
ZXRjaCBmYXVsdCwgZmF1bHRfYWRkcmVzcyBjb250YWlucyB0aGUgaW5zdHJ1Y3Rpb24gcG9pbnRl
ci4KKwkgKi8KKwlpZiAodmNwdS0+YXJjaC5tbXUtPmRpcmVjdF9tYXAgJiYKKwkgICAgbGlrZWx5
KCEoZXJyb3JfY29kZSAmIFBGRVJSX0ZFVENIX01BU0spKSAmJgorCSAgICAoZXJyb3JfY29kZSAm
IFBGRVJSX0dVRVNUX0ZJTkFMX01BU0spKSB7CiAJCXZjcHUtPmFyY2guZ3BhX2F2YWlsYWJsZSA9
IHRydWU7CiAJCXZjcHUtPmFyY2guZ3BhX3ZhbCA9IGNyMjsKIAl9Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
