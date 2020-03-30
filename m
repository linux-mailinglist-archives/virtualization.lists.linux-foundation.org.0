Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D9B197876
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 88D96869D0;
	Mon, 30 Mar 2020 10:12:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a8sAHQdB8s8p; Mon, 30 Mar 2020 10:12:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DAA6B869D7;
	Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C571CC07FF;
	Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A5ECC1AE8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 86C6086972
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZ4sxjYoJ02T
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 43B8186962
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:52 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 5F55730747C3; Mon, 30 Mar 2020 13:12:49 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 3F56A305B7A0;
 Mon, 30 Mar 2020 13:12:49 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 06/81] KVM: doc: fix the hypercall numbering
Date: Mon, 30 Mar 2020 13:11:53 +0300
Message-Id: <20200330101308.21702-7-alazar@bitdefender.com>
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

VGhlIG5leHQgaHlwZXJjYWxscyB3aWxsIHVzZSBwcm9wZXIgbnVtYmVycy4KClNpZ25lZC1vZmYt
Ynk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBEb2N1bWVu
dGF0aW9uL3ZpcnQva3ZtL2h5cGVyY2FsbHMucnN0IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vdmlydC9rdm0vaHlwZXJjYWxscy5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2h5cGVy
Y2FsbHMucnN0CmluZGV4IGRiYWYyMDdlNTYwZC4uODEyOTRhYWVhMDdhIDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL3ZpcnQva3ZtL2h5cGVyY2FsbHMucnN0CisrKyBiL0RvY3VtZW50YXRpb24v
dmlydC9rdm0vaHlwZXJjYWxscy5yc3QKQEAgLTEzNyw3ICsxMzcsNyBAQCBjb21wdXRlIHRoZSBD
TE9DS19SRUFMVElNRSBmb3IgaXRzIGNsb2NrLCBhdCB0aGUgc2FtZSBpbnN0YW50LgogUmV0dXJu
cyBLVk1fRU9QTk9UU1VQUCBpZiB0aGUgaG9zdCBkb2VzIG5vdCB1c2UgVFNDIGNsb2Nrc291cmNl
LAogb3IgaWYgY2xvY2sgdHlwZSBpcyBkaWZmZXJlbnQgdGhhbiBLVk1fQ0xPQ0tfUEFJUklOR19X
QUxMQ0xPQ0suCiAKLTYuIEtWTV9IQ19TRU5EX0lQSQorNy4gS1ZNX0hDX1NFTkRfSVBJCiAtLS0t
LS0tLS0tLS0tLS0tLS0KIAogOkFyY2hpdGVjdHVyZTogeDg2CkBAIC0xNTgsNyArMTU4LDcgQEAg
Y29ycmVzcG9uZHMgdG8gdGhlIEFQSUMgSUQgYTIrMSwgYW5kIHNvIG9uLgogCiBSZXR1cm5zIHRo
ZSBudW1iZXIgb2YgQ1BVcyB0byB3aGljaCB0aGUgSVBJcyB3ZXJlIGRlbGl2ZXJlZCBzdWNjZXNz
ZnVsbHkuCiAKLTcuIEtWTV9IQ19TQ0hFRF9ZSUVMRAorOC4gS1ZNX0hDX1NDSEVEX1lJRUxECiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0KIAogOkFyY2hpdGVjdHVyZTogeDg2Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
