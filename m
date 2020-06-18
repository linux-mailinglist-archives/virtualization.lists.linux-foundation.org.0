Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE361FFCDD
	for <lists.virtualization@lfdr.de>; Thu, 18 Jun 2020 22:44:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 679408980F;
	Thu, 18 Jun 2020 20:44:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s8-Nl3fUOXCb; Thu, 18 Jun 2020 20:44:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 07E928980D;
	Thu, 18 Jun 2020 20:44:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCD6DC016E;
	Thu, 18 Jun 2020 20:44:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0373AC016E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 20:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DACB488927
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 20:44:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ef9gtnbJyQJX
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 20:44:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 651968891A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 20:44:39 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id y5so8714000iob.12
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 13:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=D6zAGzZWuZa0oFGEmpTbPsGabz2PHS5ZFP1yihEV4W0=;
 b=gfBjoJbGQBkPQ8DZBKnWdy2L2LApK2hcz0RXH0Edd+Rq+b+by5Z+gvUsveCqLLapmT
 N8rCt19Fey1u4VE7UJ9w26l3eCsxNMEpfUZ8uPnfZ+UZs9XzN4XGmzbYjCnjib0wHBtn
 cOS63n+NZhtbmPjMdzkwex/mIqj3WGkLALtgWVan1WC6FFeil0f77RFFkzHzFnn/0nFX
 QTJc6rKAs+5x1ifYdmxWxfd+Q3OA7EaeGtLBUZRXy/wHGZV0/LIlSgNPmO7pyYk3L8Ps
 0Yaunh6s1M0JExyWA5EmJTNiNlwdi+y8Bka1WTWajaavKSJQrvGGhAOVZMtUbPcLoA80
 wY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=D6zAGzZWuZa0oFGEmpTbPsGabz2PHS5ZFP1yihEV4W0=;
 b=Zd6oFYVzyp1q693qqGyK4tOxuOSu2mVpNQlfqMV4fRSqVj4s+lI/b+bxPVFeFZVxkC
 VKg8t1ZKiZK2OGD91kWoZ5djMs8F2Q7Y4QAFI/ckDXGgCD6YB262eopCy7jTVjDRy30Y
 3LCFkkoyMBRfFvYkB3vSDw0hyujJ2m3JXF0JRHnJZwcbeAxFO6F/6tOVmDIji6l4nLLz
 Ojfc8dtvHaZua9GBTYThGxUQUPUaXK6Sil9vXsjT926sqOuE0ZuSNQZDpoRU7F5nbs6M
 mDUiow23Y7TULPduwMaxMRuGmxooqDc5Fcwqk5MN2hyWM3P/Wwb/B7HQgOu8rGFf0nUZ
 7+Ww==
X-Gm-Message-State: AOAM530/R7tUcy2QSbLJuJMG6xjE28vV7Ju+J5OCkMVLkzYfGd72B/WI
 4LLzCwuFjiY2hSLRdpCRr7tBXhAp8nFu0riwgIHWC5aC
X-Google-Smtp-Source: ABdhPJzJXZsid9+V0oSm0oCzleR1spK3NZ922mRNe7ltwO4UkAhgn4WDVOLFuPpAwxUJONYmAqnyGVxlmuqy01GMIKk=
X-Received: by 2002:a6b:6705:: with SMTP id b5mr580614ioc.29.1592513078363;
 Thu, 18 Jun 2020 13:44:38 -0700 (PDT)
MIME-Version: 1.0
From: VHPC 20 <vhpc.dist@gmail.com>
Date: Thu, 18 Jun 2020 22:44:27 +0200
Message-ID: <CAF05tLNSXT+9JDSQaXaaYJYWT0CymoTq1adBV3hj7QhnBXHxWg@mail.gmail.com>
Subject: VHPC Zoom 25th of June Call for Participation: 15th Workshop on
 Virtualization in High-Performance Cloud Computing
To: virtualization@lists.linux-foundation.org
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

V2UgY29yZGlhbGx5IGludml0ZSB5b3UgdG8gcGFydGljaXBhdGUgb25saW5lIGluIHRoZQoxNXRo
IFdvcmtzaG9wIG9uIFZpcnR1YWxpemF0aW9uIGluIEhpZ2jCrS1QZXJmb3JtYW5jZSBDbG91ZCBD
b21wdXRpbmcgIChWSFBDICcyMCkKCktleW5vdGU6IFJlZEhhdCBvbiBQb2RtYW4gKGEgRG9ja2Vy
IGFsdGVybmF0aXZlKSBmb3IgSFBDClRhbGtzIGluY2x1ZGU6IEdvb2dsZSBvbiBBdXRvcGlsb3Qg
KEdvb2dsZSBpbnRlcm5hbGx5IHVzZWQgYXV0b3NjYWxlcikKClRoaXMgeWVhcidzIGZvY3VzIGlz
IG9uOgpPcmNoZXN0cmF0aW9uIChLdWJlcm5ldGVzKQpSZXNvdXJjZSBlZmZpY2llbmN5IHZpYSBh
dXRvLXNjYWxpbmcgKEF1dG9waWxvdCAvIEdvb2dsZSkKQ29udGFpbmVycyBmb3IgSFBDIChQb2Rt
YW4pCkxpZ2h0d2VpZ2h0IFZpcnR1YWxpemF0aW9uIC8gVW5pa2VybmVscwoKVGhlIFdvcmtzaG9w
IGlzIGJlaW5nIGhlbGQgb25saW5lIHZpYSBab29tLiBQYXJ0aWNpcGF0aW9uIGlzIGZyZWUgd2l0
aApyZWdpc3RyYXRpb24gYXQKaHR0cHM6Ly91czAyd2ViLnpvb20udXMvd2ViaW5hci9yZWdpc3Rl
ci9XTl92QzVwd21nYlE2eXBKRWZ5UThuSElnCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
