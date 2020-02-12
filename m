Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C7E159DCD
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 01:12:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4449F8464A;
	Wed, 12 Feb 2020 00:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yKiqpg7WftfM; Wed, 12 Feb 2020 00:12:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0E61184468;
	Wed, 12 Feb 2020 00:12:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3828C07FE;
	Wed, 12 Feb 2020 00:12:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D096C07FE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 00:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 76DBE852DB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 00:12:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1sZ7KxW7dllL
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 00:12:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F107584CA5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 00:12:21 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id gv17so69989pjb.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 16:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=Pr1WOT/2gw7Ui+bqMEREVDpwEXR+a792WriIpzt4B7s=;
 b=hAaKEW5qHGtMe9K0r+9i4uWI4R3ZoMh+/psZvnhtmZTk8JOlUtnKNNqWB1Mirb283u
 tG7MUfH6JiABF4KWtCFqWV73gNqKtPEQKLHogaYe8okqGHgb41jbwJFPJwr3nCY+7Uu0
 T/koDrUYm446tI/FyX3ntJioWz/ASvkIV9/Aqins4Pg65CroAuLWyUqnU0z4/e+lzOGd
 H+tNqNK+H3oELg6622w0cA/vLZHwFQP4DADvL9QeLgEmFSa7g7ujy4w0ZORVsA3W9wdC
 1PX32M5zF1910+L6+bdy1KG8CFVS1lnzY4+mG1qBmljFTOZ+Xdg0gqx4CqnDL8Y7kDGy
 uoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=Pr1WOT/2gw7Ui+bqMEREVDpwEXR+a792WriIpzt4B7s=;
 b=tLVPiPj1c08lroMECuN2tjKuDj3f/6t2v/V/LTtWoIkk9A6MddzHhBdURSPqjcl6CS
 /uSfCycQPKh1go/89gOAX/usVbnCiU4qeM2m36x7fCFOW9Zv8zMVYFYJ0RipDx77YwvR
 ZhEpT/bpcycql3hTdRVJ2nPhUFO/RX5zwHtSzh+Oyal+DEIRBRW2dGKKn5KqSQ2OQ1OU
 v3gYwEjlZhgg5JNEshm8kKMkgwR1mgBa8M7UwTNPPN7bwdWzhzzUWcPNAktbH9u3wS/K
 lEb/6BDkhIs3pJL3EbcXjMQKyg3/fVrB3a16rBakKttqcUsYx5pwoz2Nw9n1H0FkH+B9
 FfWg==
X-Gm-Message-State: APjAAAVsbDfofkpXHWJsYClPzkrxsiUaDRWZrvS4eHRao6dnM86hxbv/
 w8sKaCFHar49IbkVtIZvicFS+Q==
X-Google-Smtp-Source: APXvYqzfWf+52u5ptCvMmUlokh+ZnxotB+Jwjj8OIwwQjng66p5yI7RzfTPGOOK/x7Jm4L9EdIIjEQ==
X-Received: by 2002:a17:90a:db48:: with SMTP id
 u8mr6623427pjx.54.1581466341415; 
 Tue, 11 Feb 2020 16:12:21 -0800 (PST)
Received: from ?IPv6:2600:1010:b06b:b0e7:939:1384:befb:d8c9?
 ([2600:1010:b06b:b0e7:939:1384:befb:d8c9])
 by smtp.gmail.com with ESMTPSA id r9sm5705115pfl.136.2020.02.11.16.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 16:12:20 -0800 (PST)
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 46/62] x86/sev-es: Handle INVD Events
Date: Tue, 11 Feb 2020 16:12:19 -0800
Message-Id: <EA510462-A43C-4F7E-BFE8-B212003B3627@amacapital.net>
References: <20200211135256.24617-47-joro@8bytes.org>
In-Reply-To: <20200211135256.24617-47-joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
X-Mailer: iPhone Mail (17D50)
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
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

Cgo+IE9uIEZlYiAxMSwgMjAyMCwgYXQgNTo1MyBBTSwgSm9lcmcgUm9lZGVsIDxqb3JvQDhieXRl
cy5vcmc+IHdyb3RlOgo+IAo+IO+7v0Zyb206IFRvbSBMZW5kYWNreSA8dGhvbWFzLmxlbmRhY2t5
QGFtZC5jb20+Cj4gCj4gSW1wbGVtZW50IGEgaGFuZGxlciBmb3IgI1ZDIGV4Y2VwdGlvbnMgY2F1
c2VkIGJ5IElOVkQgaW5zdHJ1Y3Rpb25zLgoKVWgsIHdoYXQ/ICBTdXJlbHkgdGhlICNWQyBjb2Rl
IGNhbiBoYXZlIGEgY2F0Y2gtYWxsIE9PUFMgcGF0aCBmb3IgdGhpbmdzIGxpa2UgdGhpcy4gTGlu
dXggc2hvdWxkIG5ldmVyIGV2ZXIgZG8gSU5WRC4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
