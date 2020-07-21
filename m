Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C162A228A8E
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:16:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 795FE8751C;
	Tue, 21 Jul 2020 21:16:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rsoltndEcS23; Tue, 21 Jul 2020 21:16:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 91D3088702;
	Tue, 21 Jul 2020 21:16:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72F1FC016F;
	Tue, 21 Jul 2020 21:16:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D6EAC08A2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 189DD86B51
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szALfpeXFnAb
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B2C1D8511C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 8792E305D7D1; Wed, 22 Jul 2020 00:09:19 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 6F183303EF1A;
 Wed, 22 Jul 2020 00:09:19 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 05/84] KVM: doc: fix the hypercall numbering
Date: Wed, 22 Jul 2020 00:08:03 +0300
Message-Id: <20200721210922.7646-6-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
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
