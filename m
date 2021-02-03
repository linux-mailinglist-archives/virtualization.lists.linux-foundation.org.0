Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA5430E120
	for <lists.virtualization@lfdr.de>; Wed,  3 Feb 2021 18:34:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DA69986499;
	Wed,  3 Feb 2021 17:34:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Y3xFkLzM5gr; Wed,  3 Feb 2021 17:34:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 883F286A77;
	Wed,  3 Feb 2021 17:34:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 581D2C013A;
	Wed,  3 Feb 2021 17:34:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69747C013A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 17:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6205181E69
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 17:34:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IfzdKqziamGe
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 17:34:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C236081E65
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 17:34:16 +0000 (UTC)
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id DEDB2A15A4;
 Wed,  3 Feb 2021 18:34:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=6JriUFT4K4Gw
 YTQBWmEFwOKzOJIBhwKv+n4I3Bk9mZ4=; b=ZS9V4YZ72FWVi7jLDWcSYcAxKf+E
 q4/rbVgU+kTQKo0+HohUXRP4aRJctXkwRTS7slZVNXGVKEiK9xYezJH9qleb++ty
 JDcfELO4n6iMqRMMd0uR7JoH2qOXonsSXmUprzdqEdYgcb9UJ5qN8waT3PmM2XPN
 dlUUlFCn3FynQI2qXzqEURdH7WoJ1zk7yMy89/tIPNhS8TiZERrSlg8ybV0LKvN4
 OLsmqvjaD56VsoWRsLLSzTwfxCW8IgfMgG9uVJemr/v2fqHOTROjmkg4MgFGNlYR
 JULqEYM8W+YWDNKrq+WzFkkvkBm5hy9haTBbLVTHCkGRzuKehKmn9ICG+w==
Subject: Re: [virtio-dev] Re: [PATCH v2 2/9] ALSA: virtio: add virtio sound
 driver
To: Takashi Iwai <tiwai@suse.de>
References: <20210124165408.1122868-1-anton.yakovlev@opensynergy.com>
 <20210124165408.1122868-3-anton.yakovlev@opensynergy.com>
 <8754dae8-114-6383-510-de2ba9dc4fa@intel.com>
 <52f71ac6-3ec7-2884-7a64-1995f416d20a@opensynergy.com>
 <s5h35yd9jf0.wl-tiwai@suse.de>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <fb4808e7-28d6-996e-02fc-c63d0e1d8221@opensynergy.com>
Date: Wed, 3 Feb 2021 18:34:12 +0100
MIME-Version: 1.0
In-Reply-To: <s5h35yd9jf0.wl-tiwai@suse.de>
Content-Language: en-US
X-ClientProxiedBy: SR-MAIL-01.open-synergy.com (10.26.10.21) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Cc: alsa-devel@alsa-project.org, virtio-dev@lists.oasis-open.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, "Michael S. Tsirkin" <mst@redhat.com>,
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

Hi Takashi,


On 03.02.2021 17:59, Takashi Iwai wrote:
> On Tue, 02 Feb 2021 00:18:09 +0100,
> Anton Yakovlev wrote:
>>>> +/**
>>>> + * virtsnd_reset_fn() - Kernel worker's function to reset the device.
>>>> + * @work: Reset device work.
>>>> + *
>>>> + * Context: Process context.
>>>> + */
>>>> +static void virtsnd_reset_fn(struct work_struct *work)
>>>> +{
>>>> +     struct virtio_snd *snd =
>>>> +             container_of(work, struct virtio_snd, reset_work);
>>>> +     struct virtio_device *vdev = snd->vdev;
>>>> +     struct device *dev = &vdev->dev;
>>>> +     int rc;
>>>> +
>>>> +     dev_info(dev, "sound device needs reset\n");
>>>> +
>>>> +     /*
>>>> +      * It seems that the only way to properly reset the device is to
>>>> remove
>>>> +      * and re-create the ALSA sound card device.
>>>> +      *
>>>> +      * Also resetting the device involves a number of steps with
>>>> setting the
>>>> +      * status bits described in the virtio specification. And the
>>>> easiest
>>>> +      * way to get everything right is to use the virtio bus interface.
>>>> +      */
>>>> +     rc = dev->bus->remove(dev);
>>>> +     if (rc)
>>>> +             dev_warn(dev, "bus->remove() failed: %d", rc);
>>>> +
>>>> +     rc = dev->bus->probe(dev);
>>>> +     if (rc)
>>>> +             dev_err(dev, "bus->probe() failed: %d", rc);
>>>
>>> This looks very suspicious to me. Wondering what ALSA maintainers
>> will say
>>> to this.
>>
>> I'm also wondering what the virtio people have to say. This part is a
>> purely virtio specific thing. And since none of the existing virtio
>> drivers processes the request to reset the device, it is not clear what
>> is the best way to proceed here. For this reason, the most
>> straightforward and simple solution was chosen.
> 
> What is this "reset" actually supposed to do?  Reconfguring
> everything, or changing only certain parameters, devices, whatever?

It means bringing this particular device to its initial state.

After that, the driver can re-read the configurations from the device
and reconfigure everything.


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
