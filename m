Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2C1312EDB
	for <lists.virtualization@lfdr.de>; Mon,  8 Feb 2021 11:23:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6C8F785B81;
	Mon,  8 Feb 2021 10:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rnkJzGEd4eo4; Mon,  8 Feb 2021 10:23:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 164A884ECD;
	Mon,  8 Feb 2021 10:23:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6B7FC013A;
	Mon,  8 Feb 2021 10:23:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 338A9C013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 10:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 222CF84C44
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 10:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u8GqB0FEp-80
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 10:23:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 772E784ECD
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 10:23:04 +0000 (UTC)
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id A41C1A1564;
 Mon,  8 Feb 2021 11:23:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=at4jZ4jFp6mO
 dj2ztTnNdUQgOjcn7s5UMzIujxqvxMk=; b=mFe1w9DJ8y53Wf4P/7vu/IcC5equ
 c4Fb+Zyxde0kVPErILqi+EUdtOtCNg24A4RTxF9W0/5lkPLqzpubs10fs4/+u45c
 W0Ko2HZWLs7uqBD9ahFaqep85TfIdLju2+gzlwHUSTBVNOBF656LylYucFmjHv0J
 LEuvn4ZAYPEK0XMDAAZyMdg86d7Qougll1ZHQOc0gp/fGOY960kwsK8YkJzICN/S
 MlNIuWL2Omd39oReoF5BIvWmEGt6dcqQq6LEWEHUOqb/6lzN5V4wq8PXzLdLvzZJ
 ftIOlV0gz6GWBVxwoFn5iuwJIV5e0uM7h/NRQUnIn3Bf6kEMNv1oM+ciWA==
Subject: Re: [PATCH v2 0/9] ALSA: add virtio sound driver
To: Takashi Iwai <tiwai@suse.de>
References: <20210124165408.1122868-1-anton.yakovlev@opensynergy.com>
 <s5hpn1h81ot.wl-tiwai@suse.de>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <da7fd8cf-9c4d-082d-70bd-b27e242a4eb7@opensynergy.com>
Date: Mon, 8 Feb 2021 11:23:00 +0100
MIME-Version: 1.0
In-Reply-To: <s5hpn1h81ot.wl-tiwai@suse.de>
Content-Language: en-US
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Cc: virtio-dev@lists.oasis-open.org, alsa-devel@alsa-project.org, "Michael S.
 Tsirkin" <mst@redhat.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, virtualization@lists.linux-foundation.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hi Takashi,

Thank you for your hints, I actually applied them all. The only question 
that I have is...

On 03.02.2021 19:07, Takashi Iwai wrote:

[snip]

> 
> - Don't PCM stream names need to be unique?  They are all the same
>    string.

What did you mean here? Substream names?


> 
> thanks,
> 
> Takashi
> 

-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
