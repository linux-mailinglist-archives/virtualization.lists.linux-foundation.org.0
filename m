Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 603E215DDFA
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 17:02:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1186B2049B;
	Fri, 14 Feb 2020 16:02:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DwdxdTtElNeU; Fri, 14 Feb 2020 16:01:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E19C622122;
	Fri, 14 Feb 2020 16:01:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C72A1C0177;
	Fri, 14 Feb 2020 16:01:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1BAA3C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 162478665F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:01:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zmva6AXV6hcl
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:01:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1BC7A865C1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:01:57 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02C552082F;
 Fri, 14 Feb 2020 16:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696116;
 bh=4qMPwk3Z+A8sUjt+dx/THCCgEBKZVpubcsBJndD38Pg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YEujC+0ozIrwbD3xwHjs1BnkO4v+fPNEbOTGG1iY0+ABU0vFm2sa3zIMBbuWQdzbN
 E5E/0EoTcNszv5ChFakO33leT5KFFUWvnPCEPatFhz4geSgQxyjshvq+sJoAuTm4up
 nJ/h1gm0g6MrKjncmz8ZGRgVVJXW2CLlahz99s3Q=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 005/459] drm/qxl: Complete exception handling in
 qxl_device_init()
Date: Fri, 14 Feb 2020 10:54:15 -0500
Message-Id: <20200214160149.11681-5-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, spice-devel@lists.freedesktop.org,
 Markus Elfring <elfring@users.sourceforge.net>
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

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgoKWyBV
cHN0cmVhbSBjb21taXQgZGJlM2FkNjFkY2ViYzQ5ZmUzZWZjYTcwYTBmNzUyYTk1YjQ2MDBmMiBd
CgpBIGNvY2NpY2hlY2sgcnVuIHByb3ZpZGVkIGluZm9ybWF0aW9uIGxpa2UgdGhlIGZvbGxvd2lu
Zy4KCmRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2ttcy5jOjI5NToxLTc6IEVSUk9SOiBtaXNzaW5n
IGlvdW5tYXA7CmlvcmVtYXAgb24gbGluZSAxNzggYW5kIGV4ZWN1dGlvbiB2aWEgY29uZGl0aW9u
YWwgb24gbGluZSAxODUKCkdlbmVyYXRlZCBieTogc2NyaXB0cy9jb2NjaW5lbGxlL2ZyZWUvaW91
bm1hcC5jb2NjaQoKQSBqdW1wIHRhcmdldCB3YXMgc3BlY2lmaWVkIGluIGFuIGlmIGJyYW5jaC4g
VGhlIGNvcnJlc3BvbmRpbmcgZnVuY3Rpb24KY2FsbCBkaWQgbm90IHJlbGVhc2UgdGhlIGRlc2ly
ZWQgc3lzdGVtIHJlc291cmNlIHRoZW4uClRodXMgdXNlIHRoZSBsYWJlbCDigJxyb21fdW5tYXDi
gJ0gaW5zdGVhZCB0byBmaXggdGhlIGV4Y2VwdGlvbiBoYW5kbGluZwpmb3IgdGhpcyBmdW5jdGlv
biBpbXBsZW1lbnRhdGlvbi4KCkZpeGVzOiA1MDQzMzQ4YTQ5NjlhZTE2NjFjMDA4ZWZlOTI5YWJk
MGQ3NmUzNzkyICgiZHJtOiBxeGw6IEZpeCBlcnJvciBoYW5kbGluZyBhdCBxeGxfZGV2aWNlX2lu
aXQiKQpTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgRWxmcmluZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vm
b3JnZS5uZXQ+Ckxpbms6IGh0dHA6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21z
Z2lkLzVlNWVmOWM0LTRkODUtM2M5My1jZjI4LTQyY2ZjYjViMDY0OUB3ZWIuZGUKU2lnbmVkLW9m
Zi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IFNh
c2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4
bF9rbXMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2ttcy5jIGIvZHJpdmVy
cy9ncHUvZHJtL3F4bC9xeGxfa21zLmMKaW5kZXggNjExY2JlN2FlZTY5MC4uYmZjMTYzMTA5M2U5
YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfa21zLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3F4bC9xeGxfa21zLmMKQEAgLTE4NCw3ICsxODQsNyBAQCBpbnQgcXhsX2Rldmlj
ZV9pbml0KHN0cnVjdCBxeGxfZGV2aWNlICpxZGV2LAogCiAJaWYgKCFxeGxfY2hlY2tfZGV2aWNl
KHFkZXYpKSB7CiAJCXIgPSAtRU5PREVWOwotCQlnb3RvIHN1cmZhY2VfbWFwcGluZ19mcmVlOwor
CQlnb3RvIHJvbV91bm1hcDsKIAl9CiAKIAlyID0gcXhsX2JvX2luaXQocWRldik7Ci0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==
