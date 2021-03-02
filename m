Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5C8329669
	for <lists.virtualization@lfdr.de>; Tue,  2 Mar 2021 07:29:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65CC083D97;
	Tue,  2 Mar 2021 06:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id reEOtsk_31EV; Tue,  2 Mar 2021 06:29:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2172E83D99;
	Tue,  2 Mar 2021 06:29:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4EC1C0001;
	Tue,  2 Mar 2021 06:29:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 887CEC0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 06:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69C1C606FF
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 06:29:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=opensynergy.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UQeQ89T2TyAc
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 06:29:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E9F96069F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 06:29:24 +0000 (UTC)
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 60282A1377;
 Tue,  2 Mar 2021 07:29:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=8Yt0B43U8OdE
 T4kdbA88SrJ5iYbOz8v13cIrkyLZ+4k=; b=MjzEBush0yFIE3j0zZ105jP/PY0E
 D7YBPxe7Y6qKmIURtf+Tb8KDVY8cPScamz6XWS7xHZZKlpQ5+c2rW4Q2vJ8/3B+k
 /AmeysgEuNtVxig0nxAscB2F9Yf8g9Ps3bhJIJ61HedqfjTSepLn12bOyOdPu0wB
 zq8EDJPin6Z9i8mHmEyv1RjHRKGRq3Stzk/FCVqHPKULSZyLDta1zG7B1qmqWO+0
 Hw+X6jbo7xY+/GOPgcQi+Eay9FBv1KO/A647aghWFKbYx6UGPx5poyus39XXm8oU
 kOKM2sPwI/VxIYfhqCxWAz4lmm/LZLqH/vCoHcoDTLcEoF9PaVlTIpGwrg==
Subject: Re: [PATCH v6 9/9] ALSA: virtio: introduce device suspend/resume
 support
To: Takashi Iwai <tiwai@suse.de>
References: <20210227085956.1700687-1-anton.yakovlev@opensynergy.com>
 <20210227085956.1700687-10-anton.yakovlev@opensynergy.com>
 <s5hpn0kjt31.wl-tiwai@suse.de>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <7d4daea0-ed59-e84c-c28a-945c49204c83@opensynergy.com>
Date: Tue, 2 Mar 2021 07:29:20 +0100
MIME-Version: 1.0
In-Reply-To: <s5hpn0kjt31.wl-tiwai@suse.de>
Content-Language: en-US
X-ClientProxiedBy: SR-MAIL-01.open-synergy.com (10.26.10.21) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Cc: virtio-dev@lists.oasis-open.org, alsa-devel@alsa-project.org, "Michael S.
 Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 28.02.2021 13:05, Takashi Iwai wrote:
> On Sat, 27 Feb 2021 09:59:56 +0100,
> Anton Yakovlev wrote:
>>

[snip]

>> --- a/sound/virtio/virtio_pcm.c
>> +++ b/sound/virtio/virtio_pcm.c
>> @@ -109,6 +109,7 @@ static int virtsnd_pcm_build_hw(struct virtio_pcm_substream *vss,
>>                SNDRV_PCM_INFO_BATCH |
>>                SNDRV_PCM_INFO_BLOCK_TRANSFER |
>>                SNDRV_PCM_INFO_INTERLEAVED |
>> +             SNDRV_PCM_INFO_RESUME |
>>                SNDRV_PCM_INFO_PAUSE;
> 
> Actually you don't need to set SNDRV_PCM_INFO_RESUME.
> This flag means that the driver supports the full resume procedure,
> which isn't often the case; with this, the driver is supposed to
> resume the stream exactly from the suspended position.
> 
> Most drivers don't set this but implement only the suspend-stop
> action.  Then the application (or the sound backend) will re-setup the
> stream and restart accordingly.

I tried to resume driver without SNDRV_PCM_INFO_RESUME, and alsa-lib
called only ops->prepare(). It makes sense for a typical hw, but we have
"clean" unconfigured device on resume. And we must set hw parameters as
a first step. It means, that code should be more or less the same. And
maybe it's better to set SNDRV_PCM_INFO_RESUME, since it allows us to
resume substream in any situation (regardless of application behavior).
I can refactor code to only send requests from trigger(RESUME) path and
not to call ops itself. It should make code more straitforward. What do
you say?


-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
