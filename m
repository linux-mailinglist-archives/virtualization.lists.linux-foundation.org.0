Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE6F2D1ABD
	for <lists.virtualization@lfdr.de>; Mon,  7 Dec 2020 21:46:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E96A087942;
	Mon,  7 Dec 2020 20:46:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bVQN9n5+KZTD; Mon,  7 Dec 2020 20:46:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 885608796B;
	Mon,  7 Dec 2020 20:46:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63BA2C0FA7;
	Mon,  7 Dec 2020 20:46:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C627BC0FA7
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B3F3586EB7
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wO9yibuuMhQ7
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F04A6869F7
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:13 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 75CAF305D4FC; Mon,  7 Dec 2020 22:46:12 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 51E963072784;
 Mon,  7 Dec 2020 22:46:12 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v11 04/81] KVM: doc: fix the hypercalls numbering
Date: Mon,  7 Dec 2020 22:45:05 +0200
Message-Id: <20201207204622.15258-5-alazar@bitdefender.com>
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

VGhlIG5leHQgaHlwZXJjYWxscyB3aWxsIGJlIGNvcnJlY3RseSBudW1iZXJlZC4KClNpZ25lZC1v
ZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBEb2N1
bWVudGF0aW9uL3ZpcnQva3ZtL2h5cGVyY2FsbHMucnN0IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vdmlydC9rdm0vaHlwZXJjYWxscy5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2h5
cGVyY2FsbHMucnN0CmluZGV4IGVkNGZkZGQzNjRlYS4uNzBlNzdjNjZiNjRjIDEwMDY0NAotLS0g
YS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2h5cGVyY2FsbHMucnN0CisrKyBiL0RvY3VtZW50YXRp
b24vdmlydC9rdm0vaHlwZXJjYWxscy5yc3QKQEAgLTEzNyw3ICsxMzcsNyBAQCBjb21wdXRlIHRo
ZSBDTE9DS19SRUFMVElNRSBmb3IgaXRzIGNsb2NrLCBhdCB0aGUgc2FtZSBpbnN0YW50LgogUmV0
dXJucyBLVk1fRU9QTk9UU1VQUCBpZiB0aGUgaG9zdCBkb2VzIG5vdCB1c2UgVFNDIGNsb2Nrc291
cmNlLAogb3IgaWYgY2xvY2sgdHlwZSBpcyBkaWZmZXJlbnQgdGhhbiBLVk1fQ0xPQ0tfUEFJUklO
R19XQUxMQ0xPQ0suCiAKLTYuIEtWTV9IQ19TRU5EX0lQSQorNy4gS1ZNX0hDX1NFTkRfSVBJCiAt
LS0tLS0tLS0tLS0tLS0tLS0KIAogOkFyY2hpdGVjdHVyZTogeDg2CkBAIC0xNTgsNyArMTU4LDcg
QEAgY29ycmVzcG9uZHMgdG8gdGhlIEFQSUMgSUQgYTIrMSwgYW5kIHNvIG9uLgogCiBSZXR1cm5z
IHRoZSBudW1iZXIgb2YgQ1BVcyB0byB3aGljaCB0aGUgSVBJcyB3ZXJlIGRlbGl2ZXJlZCBzdWNj
ZXNzZnVsbHkuCiAKLTcuIEtWTV9IQ19TQ0hFRF9ZSUVMRAorOC4gS1ZNX0hDX1NDSEVEX1lJRUxE
CiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0KIAogOkFyY2hpdGVjdHVyZTogeDg2Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
