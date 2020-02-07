Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E039315573C
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 12:57:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7114B863A8;
	Fri,  7 Feb 2020 11:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m6IIdH2pXrzh; Fri,  7 Feb 2020 11:57:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0B2EE8687B;
	Fri,  7 Feb 2020 11:57:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CDB75C013E;
	Fri,  7 Feb 2020 11:57:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58EBCC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 11:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4020A8687B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 11:57:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id At+ULzBOfMHp
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 11:57:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4584C863A8
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581076674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l9Om1VdDqKQp4D0lip8cfLl2U7Dg5Wq0M3QVMJgD+1I=;
 b=dhWg7OQHsxIDfCIREv3AWnjgDtBzv8WdDauoqdfLzjojON41zTGoaWdBV9xdqTthdYsxzZ
 0azoFY0/+9ng7Fio9QQCPkZdhMOCcSDZkrPZMoWq7XWRuoVfzG7dO32MeJbeA+8rhMIOj0
 TXYX1GfKmdpMP8hKR6EuboBzIGaFqqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-Wx585QMENKWhZ0HmxUjXYA-1; Fri, 07 Feb 2020 06:57:49 -0500
X-MC-Unique: Wx585QMENKWhZ0HmxUjXYA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30061DBA3;
 Fri,  7 Feb 2020 11:57:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 606D4790F2;
 Fri,  7 Feb 2020 11:57:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A26201747D; Fri,  7 Feb 2020 12:57:44 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/bochs: downgrade pci_request_region failure from error
 to warning
Date: Fri,  7 Feb 2020 12:57:44 +0100
Message-Id: <20200207115744.4559-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: marmarek@invisiblethingslab.com, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Daniel Vetter <daniel@ffwll.ch>
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

U2h1dGRvd24gb2YgZmlybXdhcmUgZnJhbWVidWZmZXIgaGFzIGEgYnVuY2ggb2YgcHJvYmxlbXMu
ICBCZWNhdXNlCm9mIHRoaXMgdGhlIGZyYW1lYnVmZmVyIHJlZ2lvbiBtaWdodCBzdGlsbCBiZSBy
ZXNlcnZlZCBldmVuIGFmdGVyCmRybV9mYl9oZWxwZXJfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9m
cmFtZWJ1ZmZlcnMoKSByZXR1cm5lZC4KCkRvbid0IGNvbnNpZGVyIHBjaV9yZXF1ZXN0X3JlZ2lv
bigpIGZhaWx1cmUgZm9yIHRoZSBmcmFtZWJ1ZmZlcgpyZWdpb24gYXMgZmF0YWwgZXJyb3IgdG8g
d29ya2Fyb3VuZCB0aGlzIGlzc3VlLgoKUmVwb3J0ZWQtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1H
w7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KU2lnbmVkLW9mZi1ieTog
R2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Jv
Y2hzL2JvY2hzX2h3LmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19o
dy5jIGIvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2h3LmMKaW5kZXggYjYxNWI3ZGZkZDlk
Li5hMzg3ZWZhOWU1NTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19o
dy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19ody5jCkBAIC0xNTcsOCArMTU3
LDcgQEAgaW50IGJvY2hzX2h3X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAl9CiAKIAlp
ZiAocGNpX3JlcXVlc3RfcmVnaW9uKHBkZXYsIDAsICJib2Nocy1kcm0iKSAhPSAwKSB7Ci0JCURS
TV9FUlJPUigiQ2Fubm90IHJlcXVlc3QgZnJhbWVidWZmZXJcbiIpOwotCQlyZXR1cm4gLUVCVVNZ
OworCQlEUk1fV0FSTigiQ2Fubm90IHJlcXVlc3QgZnJhbWVidWZmZXIsIGJvb3QgZnJhbWVidWZm
ZXIgc3RpbGwgYWN0aXZlP1xuIik7CiAJfQogCiAJYm9jaHMtPmZiX21hcCA9IGlvcmVtYXAoYWRk
ciwgc2l6ZSk7Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
