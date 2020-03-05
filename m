Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6650A17AB79
	for <lists.virtualization@lfdr.de>; Thu,  5 Mar 2020 18:14:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0FEC4861EE;
	Thu,  5 Mar 2020 17:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_nJYbosrIQg; Thu,  5 Mar 2020 17:14:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 79764861F2;
	Thu,  5 Mar 2020 17:14:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54393C013E;
	Thu,  5 Mar 2020 17:14:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 790D0C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 17:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6FEAE848A3
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 17:14:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NjY-ZxvIMiPp
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 17:14:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D2F9D8473A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 17:14:53 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B60420848;
 Thu,  5 Mar 2020 17:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583428493;
 bh=ub1e6VQTs9jE/F1xf+C+Yz3QqzEx23k/ksrr7W9aNuQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gcGScbG+cs39hMiE21fcVMyebUobM4weW/AtIbdAc2WEOCCmwepdKKX0vB9wA4syF
 k+uc/9zAbI5xEUWQ4hMbkMFQb1De2+b2xt0hNZpE9QnY9P3mF8h2e/Tg4GeyiwCwCd
 Z653CfuaHCEHxhvoEd6kGvWjGXfDzpmmM69t0Btg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 26/58] vhost: Check docket sk_family instead of
 call getname
Date: Thu,  5 Mar 2020 12:13:47 -0500
Message-Id: <20200305171420.29595-26-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305171420.29595-1-sashal@kernel.org>
References: <20200305171420.29595-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 syzbot+f2a62d07a5198c819c7b@syzkaller.appspotmail.com,
 "David S . Miller" <davem@davemloft.net>
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

RnJvbTogRXVnZW5pbyBQw6lyZXogPGVwZXJlem1hQHJlZGhhdC5jb20+CgpbIFVwc3RyZWFtIGNv
bW1pdCA0MmQ4NGM4NDkwZjlmMDkzMTc4NmYxNjIzMTkxZmNhYjM5N2MzZDY0IF0KCkRvaW5nIHNv
LCB3ZSBzYXZlIG9uZSBjYWxsIHRvIGdldCBkYXRhIHdlIGFscmVhZHkgaGF2ZSBpbiB0aGUgc3Ry
dWN0LgoKQWxzbywgc2luY2UgdGhlcmUgaXMgbm8gZ3VhcmFudGVlIHRoYXQgZ2V0bmFtZSB1c2Ug
c29ja2FkZHJfbGwKcGFyYW1ldGVyIGJleW9uZCBpdHMgc2l6ZSwgd2UgYWRkIGEgbGl0dGxlIGJp
dCBvZiBzZWN1cml0eSBoZXJlLgpJdCBzaG91bGQgZG8gbm90IGRvIGJleW9uZCBNQVhfQUREUl9M
RU4sIGJ1dCBzeXpib3QgZm91bmQgdGhhdApheDI1X2dldG5hbWUgd3JpdGVzIG1vcmUgKDcyIGJ5
dGVzLCB0aGUgc2l6ZSBvZiBmdWxsX3NvY2thZGRyX2F4MjUsCnZlcnN1cyAyMCArIDMyIGJ5dGVz
IG9mIHNvY2thZGRyX2xsICsgTUFYX0FERFJfTEVOIGluIHN5emJvdCByZXBybykuCgpGaXhlczog
M2E0ZDVjOTRlOTU5MyAoInZob3N0X25ldDogYSBrZXJuZWwtbGV2ZWwgdmlydGlvIHNlcnZlciIp
ClJlcG9ydGVkLWJ5OiBzeXpib3QrZjJhNjJkMDdhNTE5OGM4MTljN2JAc3l6a2FsbGVyLmFwcHNw
b3RtYWlsLmNvbQpTaWduZWQtb2ZmLWJ5OiBFdWdlbmlvIFDDqXJleiA8ZXBlcmV6bWFAcmVkaGF0
LmNvbT4KQWNrZWQtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+ClNpZ25l
ZC1vZmYtYnk6IERhdmlkIFMuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KU2lnbmVkLW9m
Zi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvdmhvc3Qv
bmV0LmMgfCAxMCArLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDkg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC9uZXQuYyBiL2RyaXZlcnMv
dmhvc3QvbmV0LmMKaW5kZXggMWEyZGQ1M2NhYWRlYS4uYjUzYjY1MjhkNmNlMiAxMDA2NDQKLS0t
IGEvZHJpdmVycy92aG9zdC9uZXQuYworKysgYi9kcml2ZXJzL3Zob3N0L25ldC5jCkBAIC0xNDE0
LDEwICsxNDE0LDYgQEAgc3RhdGljIGludCB2aG9zdF9uZXRfcmVsZWFzZShzdHJ1Y3QgaW5vZGUg
Kmlub2RlLCBzdHJ1Y3QgZmlsZSAqZikKIAogc3RhdGljIHN0cnVjdCBzb2NrZXQgKmdldF9yYXdf
c29ja2V0KGludCBmZCkKIHsKLQlzdHJ1Y3QgewotCQlzdHJ1Y3Qgc29ja2FkZHJfbGwgc2E7Ci0J
CWNoYXIgIGJ1ZltNQVhfQUREUl9MRU5dOwotCX0gdWFkZHI7CiAJaW50IHI7CiAJc3RydWN0IHNv
Y2tldCAqc29jayA9IHNvY2tmZF9sb29rdXAoZmQsICZyKTsKIApAQCAtMTQzMCwxMSArMTQyNiw3
IEBAIHN0YXRpYyBzdHJ1Y3Qgc29ja2V0ICpnZXRfcmF3X3NvY2tldChpbnQgZmQpCiAJCWdvdG8g
ZXJyOwogCX0KIAotCXIgPSBzb2NrLT5vcHMtPmdldG5hbWUoc29jaywgKHN0cnVjdCBzb2NrYWRk
ciAqKSZ1YWRkci5zYSwgMCk7Ci0JaWYgKHIgPCAwKQotCQlnb3RvIGVycjsKLQotCWlmICh1YWRk
ci5zYS5zbGxfZmFtaWx5ICE9IEFGX1BBQ0tFVCkgeworCWlmIChzb2NrLT5zay0+c2tfZmFtaWx5
ICE9IEFGX1BBQ0tFVCkgewogCQlyID0gLUVQRk5PU1VQUE9SVDsKIAkJZ290byBlcnI7CiAJfQot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4v
bGlzdGluZm8vdmlydHVhbGl6YXRpb24=
