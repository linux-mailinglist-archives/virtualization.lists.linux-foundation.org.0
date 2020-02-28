Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC7B1735F1
	for <lists.virtualization@lfdr.de>; Fri, 28 Feb 2020 12:18:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BD218880CC;
	Fri, 28 Feb 2020 11:18:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5w1tnvbl5Mgd; Fri, 28 Feb 2020 11:18:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3D2D4880A1;
	Fri, 28 Feb 2020 11:18:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17EACC1D89;
	Fri, 28 Feb 2020 11:18:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20063C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 11:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 07FAD20455
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 11:18:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWkSksLpvgqs
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 11:18:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by silver.osuosl.org (Postfix) with ESMTPS id D4E992044C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 11:18:41 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id q9so2759871wmj.5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 03:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=c/Ym0egalVBXf93aw9WsuThWw+1/VA4cwSu0HJ2qtuE=;
 b=gJ+uZA2EvXabSadMnPv334OnIY6mjJbJ5ogfaiMnJO9YupCCKxmz7HuW2OhUdoOgJs
 mFAtzINI3raptFLcBjYqK3/P5hOzBCEIHNUhMpq9FVxcG+zpkNwH2gHBNy2IXMWLvF3C
 iCY184ZpRT4ZxbNLAmXtBfgBXy1qT8NwOEyxpDM2pOzOpF1smMwXhfVeznr6xPKc9LiC
 AaxSpuk9NIH6Dxh7HLWuHzhQuLH0FyW+HvLzd5w6SkgB/rIPDOPRYxPyV32uoWKLndq4
 DQqSYgZ+GWHgSQF8jsYStvSDOs39HspyUq/Uwj/fgLEDOWnAjSaiss6omaLD6Zzv7czZ
 OJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=c/Ym0egalVBXf93aw9WsuThWw+1/VA4cwSu0HJ2qtuE=;
 b=ZH9MBppxdJywyAWNg8GG3leOeBu89EU9n0GLSaWNFWI9P7tOZ2IXHbY22WRDwevwdC
 B2Dkp/4TtIAwm/h7j1CNBteFoIEWS638HQJU66EHoEJlNa8XW1KA+/NQa+Gt9wFsDYE8
 zDcLpJPhOD08Vrgk5sytl5Gwg718HtotDQaoFeIX51KD9wDOM2eV4OCgLvydjDdmbFhF
 Zi6/O4DGzov807eu4ejHNxw52diwaLpnEsQmGdXlVj4Kxg5xJ+TPSdPkS+rGG7EAoeow
 QXjY1IN+rWMmr57kE3JILb4+hLb3jgvOiVmLg+2Lh8Fhn1GfTT5vAexRzMcFgrPtJDoF
 42MQ==
X-Gm-Message-State: APjAAAX0K21XO4FlD8/x6uGgsK2cqR6u4kcfnO94q1eT9lAlky1mGXQ/
 EtWSwfbwrFS8ZdX8Asn1YDh2Hw==
X-Google-Smtp-Source: APXvYqwEjD+uH4GLtaIUfRbO3r95WuTpyN591p05HN8+9ZRX4Aw9L+brtlVVKcVKha7UYBygcHSxKQ==
X-Received: by 2002:a1c:9e89:: with SMTP id h131mr4342446wme.161.1582888720125; 
 Fri, 28 Feb 2020 03:18:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d17sm1685290wmb.36.2020.02.28.03.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:18:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4B7991FF87;
 Fri, 28 Feb 2020 11:18:38 +0000 (GMT)
References: <87mu93vwy2.fsf@linaro.org>
 <fca8366e-662f-af2f-382c-0216d9df63f8@redhat.com>
User-agent: mu4e 1.3.8; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [virtio-dev] VIRTIO adoption in other hypervisors
In-reply-to: <fca8366e-662f-af2f-382c-0216d9df63f8@redhat.com>
Date: Fri, 28 Feb 2020 11:18:38 +0000
Message-ID: <87k147vu29.fsf@linaro.org>
MIME-Version: 1.0
Cc: Wei Liu <liuw@liuw.name>, jan.kiszka@siemens.com,
 Stefano Stabellini <sstabellini@kernel.org>, virtio-dev@lists.oasis-open.org,
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

ClBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+IHdyaXRlczoKCj4gT24gMjgvMDIv
MjAgMTE6MTYsIEFsZXggQmVubsOpZSB3cm90ZToKPj4gICAtIEhvdyBhYm91dCBIeXBlclYgYW5k
IHRoZSBPU1ggZXF1aXZhbGVudD8KPgo+IE9TIFggSHlwZXJ2aXNvci5mcmFtZXdvcmsganVzdCB1
c2VzIFFFTVUsIHNvIGl0IGNhbiB1c2UgdmlydGlvIGRldmljZXMKPiB0b28uICBWaXJ0dWFsQm94
IGFsc28gc3VwcG9ydHMgdmlydGlvIGRldmljZXMuCgpJIGd1ZXNzIHRoZXNlIGRvbid0IGRvIGFu
eSBzb3J0IG9mIHZob3N0IHN1cHBvcnQgc28gYWxsIHZpcnRpbyBkZXZpY2VzCmFyZSBoYW5kbGVk
IGRpcmVjdGx5IGluIFFFTVU/CgotLSAKQWxleCBCZW5uw6llCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApW
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
