Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 672B32C3CFB
	for <lists.virtualization@lfdr.de>; Wed, 25 Nov 2020 10:52:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1A8FA86E04;
	Wed, 25 Nov 2020 09:52:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nthniWaSEaAk; Wed, 25 Nov 2020 09:52:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EF47C86DB6;
	Wed, 25 Nov 2020 09:52:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D650CC0052;
	Wed, 25 Nov 2020 09:52:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09FAEC0052
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F34E7874C4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rolQOHvtZsuf
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:51:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C421D874A7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:51:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 BFD94305D4F5; Wed, 25 Nov 2020 11:35:43 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id A52413072784;
 Wed, 25 Nov 2020 11:35:43 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v10 04/81] KVM: doc: fix the hypercalls numbering
Date: Wed, 25 Nov 2020 11:34:43 +0200
Message-Id: <20201125093600.2766-5-alazar@bitdefender.com>
In-Reply-To: <20201125093600.2766-1-alazar@bitdefender.com>
References: <20201125093600.2766-1-alazar@bitdefender.com>
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
