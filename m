Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C3A327AA6
	for <lists.virtualization@lfdr.de>; Mon,  1 Mar 2021 10:25:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0800B4F242;
	Mon,  1 Mar 2021 09:25:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FEh4RmeInv-b; Mon,  1 Mar 2021 09:25:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76D684F243;
	Mon,  1 Mar 2021 09:25:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED9BEC0001;
	Mon,  1 Mar 2021 09:25:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 133AFC0001
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 09:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 048CF60674
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 09:25:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=opensynergy.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fWsr6_7qpWnj
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 09:25:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2BAD605A8
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 09:25:10 +0000 (UTC)
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 850CBA133F;
 Mon,  1 Mar 2021 10:25:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=uSJJetc2M6a7
 lgzm6cOltJ6NC/DZ0gqUW8HqU2UcHXk=; b=JH4+SP78tCJ3pTYlZ48ml+43Yh5P
 Rs0dcRFPb0F2BNEVQcAzW3IeyRInsp5PuWcHCvQH1/O2NZYGUgUhEUI6WTPSch/m
 b96yDk1+SB7TRKMU1qteXiL2IPCNfBitX5qqcoI5gxNRC4lpYr+g3Y7Dj96XF0uL
 VCUILdn51VOVbEsKtwTMzuRyotgnol/QzLT/mCqdizO0UftD+kvin7MVPaH2EvPt
 oc0m4XMstF6S/NRCzfj3WTI8gWojjdWxIa3Q9P/lS6I9QqzXSbPmNVS32qrrSiad
 yvCT0miMljfuHH6ImaNxkqSncbKedSWYWZr0zhNuBJ72Pa/un5Nxs4O7Cw==
Subject: Re: [PATCH v6 5/9] ALSA: virtio: handling control and I/O messages
 for the PCM device
To: Takashi Iwai <tiwai@suse.de>
References: <20210227085956.1700687-1-anton.yakovlev@opensynergy.com>
 <20210227085956.1700687-6-anton.yakovlev@opensynergy.com>
 <s5hsg5gjutg.wl-tiwai@suse.de>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <b3de8563-1776-4296-2cf5-883c831dfbe8@opensynergy.com>
Date: Mon, 1 Mar 2021 10:25:05 +0100
MIME-Version: 1.0
In-Reply-To: <s5hsg5gjutg.wl-tiwai@suse.de>
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

On 28.02.2021 12:27, Takashi Iwai wrote:
> On Sat, 27 Feb 2021 09:59:52 +0100,
> Anton Yakovlev wrote:
>> +/**
>> + * virtsnd_pcm_event() - Handle the PCM device event notification.
>> + * @snd: VirtIO sound device.
>> + * @event: VirtIO sound event.
>> + *
>> + * Context: Interrupt context.
> 
> OK, then nonatomic PCM flag is invalid...

Well, no. Here, events are kind of independent entities. PCM-related
events are just a special case of more generic events, which can carry
any kind of notification/payload. (And at the moment, only XRUN
notification is supported for PCM substreams.) So it has nothing to do
with the atomicity of the PCM device itself.


>> +/**
>> + * virtsnd_pcm_sg_num() - Count the number of sg-elements required to represent
>> + *                        vmalloc'ed buffer.
>> + * @data: Pointer to vmalloc'ed buffer.
>> + * @length: Buffer size.
>> + *
>> + * Context: Any context.
>> + * Return: Number of physically contiguous parts in the @data.
>> + */
>> +static int virtsnd_pcm_sg_num(u8 *data, unsigned int length)
>> +{
>> +     phys_addr_t sg_address;
>> +     unsigned int sg_length;
>> +     int num = 0;
>> +
>> +     while (length) {
>> +             struct page *pg = vmalloc_to_page(data);
>> +             phys_addr_t pg_address = page_to_phys(pg);
>> +             size_t pg_length;
>> +
>> +             pg_length = PAGE_SIZE - offset_in_page(data);
>> +             if (pg_length > length)
>> +                     pg_length = length;
>> +
>> +             if (!num || sg_address + sg_length != pg_address) {
>> +                     sg_address = pg_address;
>> +                     sg_length = pg_length;
>> +                     num++;
>> +             } else {
>> +                     sg_length += pg_length;
>> +             }
>> +
>> +             data += pg_length;
>> +             length -= pg_length;
>> +     }
>> +
>> +     return num;
>> +}
>> +
>> +/**
>> + * virtsnd_pcm_sg_from() - Build sg-list from vmalloc'ed buffer.
>> + * @sgs: Preallocated sg-list to populate.
>> + * @nsgs: The maximum number of elements in the @sgs.
>> + * @data: Pointer to vmalloc'ed buffer.
>> + * @length: Buffer size.
>> + *
>> + * Splits the buffer into physically contiguous parts and makes an sg-list of
>> + * such parts.
>> + *
>> + * Context: Any context.
>> + */
>> +static void virtsnd_pcm_sg_from(struct scatterlist *sgs, int nsgs, u8 *data,
>> +                             unsigned int length)
>> +{
>> +     int idx = -1;
>> +
>> +     while (length) {
>> +             struct page *pg = vmalloc_to_page(data);
>> +             size_t pg_length;
>> +
>> +             pg_length = PAGE_SIZE - offset_in_page(data);
>> +             if (pg_length > length)
>> +                     pg_length = length;
>> +
>> +             if (idx == -1 ||
>> +                 sg_phys(&sgs[idx]) + sgs[idx].length != page_to_phys(pg)) {
>> +                     if (idx + 1 == nsgs)
>> +                             break;
>> +                     sg_set_page(&sgs[++idx], pg, pg_length,
>> +                                 offset_in_page(data));
>> +             } else {
>> +                     sgs[idx].length += pg_length;
>> +             }
>> +
>> +             data += pg_length;
>> +             length -= pg_length;
>> +     }
>> +
>> +     sg_mark_end(&sgs[idx]);
>> +}
> 
> Hmm, I thought there can be already a handy helper to convert vmalloc
> to sglist, but apparently not.  It should have been trivial to get the
> page list from vmalloc, e.g.
> 
> int vmalloc_to_page_list(void *p, struct page **page_ret)
> {
>          struct vmap_area *va;
> 
>          va = find_vmap_area((unsigned long)p);
>          if (!va)
>                  return 0;
>          *page_ret = va->vm->pages;
>          return va->vm->nr_pages;
> }
> 
> Then you can set up the sg list in a single call from the given page
> list.
> 
> But it's just a cleanup, and let's mark it as a room for
> improvements.

Yeah, we can take a look into some kind of optimizations here. But I
suspect, the overall code will look similar. It is not enough just to
get a list of pages, you also need to build a list of physically
contiguous regions from it. Because the sg-elements are put into a
virtqueue that has a limited size. And each sg-element consumes one item
in the virtqueue. And since the virtqueue itself is shared between all
substreams, the items of the virtqueue become a scarce resource.


> (snip)
>> +/**
>> + * virtsnd_pcm_msg_complete() - Complete an I/O message.
>> + * @msg: I/O message.
>> + * @written_bytes: Number of bytes written to the message.
>> + *
>> + * Completion of the message means the elapsed period. If transmission is
>> + * allowed, then each completed message is immediately placed back at the end
>> + * of the queue.
>> + *
>> + * For the playback substream, @written_bytes is equal to sizeof(msg->status).
>> + *
>> + * For the capture substream, @written_bytes is equal to sizeof(msg->status)
>> + * plus the number of captured bytes.
>> + *
>> + * Context: Interrupt context. Takes and releases the VirtIO substream spinlock.
>> + */
>> +static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
>> +                                  size_t written_bytes)
>> +{
>> +     struct virtio_pcm_substream *vss = msg->substream;
>> +
>> +     /*
>> +      * hw_ptr always indicates the buffer position of the first I/O message
>> +      * in the virtqueue. Therefore, on each completion of an I/O message,
>> +      * the hw_ptr value is unconditionally advanced.
>> +      */
>> +     spin_lock(&vss->lock);
>> +     /*
>> +      * If the capture substream returned an incorrect status, then just
>> +      * increase the hw_ptr by the message size.
>> +      */
>> +     if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK ||
>> +         written_bytes <= sizeof(msg->status)) {
>> +             struct scatterlist *sg;
>> +
>> +             for (sg = &msg->sgs[PCM_MSG_SG_DATA]; sg; sg = sg_next(sg))
>> +                     vss->hw_ptr += sg->length;
> 
> So the sg list entries are supposed to be updated?  Or if the length
> there are constant, we don't need to iterate the sg entries but keep
> the total length beforehand?

That's one of options. Since the same info can be derived from sg-list,
I thought it might be not necessary to keep it in some additional field.
But probably it makes sense to keep total length in the message
structure itself. Then it will be more flexible (if we will need to
create non-period sized messages in the future).


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
