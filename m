Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A57F1194C91
	for <lists.virtualization@lfdr.de>; Fri, 27 Mar 2020 00:25:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 61ADF89343;
	Thu, 26 Mar 2020 23:25:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vJd6Kq-+n--e; Thu, 26 Mar 2020 23:25:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3CF7189339;
	Thu, 26 Mar 2020 23:25:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F3F6C0177;
	Thu, 26 Mar 2020 23:25:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB864C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 23:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E844F875EA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 23:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rZOAa-oVWrS
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 23:25:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 82C08875DF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 23:25:38 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D2B9208FE;
 Thu, 26 Mar 2020 23:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585265138;
 bh=TOlzQZqFBlXXk6vVW3nEQ7OnPHurudRh2uEU+6f1lvY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fN6YBz+eRZdqYhXsmmijW/1SwraTA1mssXq+s3IqzDU7BZWIzWn+H/tSLBrzqP11V
 fJ4DIshsFn2j1hm6qaXLUZ1PFEcjKz2Qe9XaNeZ5DGHEIqanu2eMpIRBLVwRjkqvEp
 tVsDPpVxrHvBcnL0lkDABJUPXmUsXGbmI5uq8ZYE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 2/4] drm/bochs: downgrade pci_request_region
 failure from error to warning
Date: Thu, 26 Mar 2020 19:25:33 -0400
Message-Id: <20200326232535.8460-2-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326232535.8460-1-sashal@kernel.org>
References: <20200326232535.8460-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Sam Ravnborg <sam@ravnborg.org>
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

RnJvbTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCA4YzM0Y2QxYTdmMDg5ZGMwMzkzMzI4OWM1ZDRhNGQxNDg5NTQ5ODI4IF0KClNodXRkb3duIG9m
IGZpcm13YXJlIGZyYW1lYnVmZmVyIGhhcyBhIGJ1bmNoIG9mIHByb2JsZW1zLiAgQmVjYXVzZQpv
ZiB0aGlzIHRoZSBmcmFtZWJ1ZmZlciByZWdpb24gbWlnaHQgc3RpbGwgYmUgcmVzZXJ2ZWQgZXZl
biBhZnRlcgpkcm1fZmJfaGVscGVyX3JlbW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVidWZmZXJz
KCkgcmV0dXJuZWQuCgpEb24ndCBjb25zaWRlciBwY2lfcmVxdWVzdF9yZWdpb24oKSBmYWlsdXJl
IGZvciB0aGUgZnJhbWVidWZmZXIKcmVnaW9uIGFzIGZhdGFsIGVycm9yIHRvIHdvcmthcm91bmQg
dGhpcyBpc3N1ZS4KClJlcG9ydGVkLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1h
cm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+ClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1h
bm4gPGtyYXhlbEByZWRoYXQuY29tPgpBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgpMaW5rOiBodHRwOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dp
ZC8yMDIwMDMxMzA4NDE1Mi4yNzM0LTEta3JheGVsQHJlZGhhdC5jb20KU2lnbmVkLW9mZi1ieTog
U2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ib2No
cy9ib2Noc19ody5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hz
X2h3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcuYwppbmRleCBhMzliMDM0M2Mx
OTdkLi40MDFjMjE4NTY3YWY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9j
aHNfaHcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcuYwpAQCAtOTcsMTAg
Kzk3LDggQEAgaW50IGJvY2hzX2h3X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdWludDMy
X3QgZmxhZ3MpCiAJCXNpemUgPSBtaW4oc2l6ZSwgbWVtKTsKIAl9CiAKLQlpZiAocGNpX3JlcXVl
c3RfcmVnaW9uKHBkZXYsIDAsICJib2Nocy1kcm0iKSAhPSAwKSB7Ci0JCURSTV9FUlJPUigiQ2Fu
bm90IHJlcXVlc3QgZnJhbWVidWZmZXJcbiIpOwotCQlyZXR1cm4gLUVCVVNZOwotCX0KKwlpZiAo
cGNpX3JlcXVlc3RfcmVnaW9uKHBkZXYsIDAsICJib2Nocy1kcm0iKSAhPSAwKQorCQlEUk1fV0FS
TigiQ2Fubm90IHJlcXVlc3QgZnJhbWVidWZmZXIsIGJvb3QgZmIgc3RpbGwgYWN0aXZlP1xuIik7
CiAKIAlib2Nocy0+ZmJfbWFwID0gaW9yZW1hcChhZGRyLCBzaXplKTsKIAlpZiAoYm9jaHMtPmZi
X21hcCA9PSBOVUxMKSB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
