Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B6B3027BD
	for <lists.virtualization@lfdr.de>; Mon, 25 Jan 2021 17:25:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9FB2F870B4;
	Mon, 25 Jan 2021 16:25:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AIhmR7A-v49z; Mon, 25 Jan 2021 16:25:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9B5F7870B5;
	Mon, 25 Jan 2021 16:25:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FAF0C013A;
	Mon, 25 Jan 2021 16:25:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C9A2C013A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Jan 2021 16:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 455BB20491
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Jan 2021 16:25:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uAvsWVsSnasl
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Jan 2021 16:25:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by silver.osuosl.org (Postfix) with ESMTPS id 15FE720031
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Jan 2021 16:25:18 +0000 (UTC)
IronPort-SDR: xH4+9DM6TzaycdoM/PQG7QsvlHRz2s/IENJq5oWSkTOfnJ6BLfHe/8OiBX4edQR7o7xB7O8qS+
 O1V2in6HSckw==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="179902350"
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; d="scan'208";a="179902350"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 08:25:17 -0800
IronPort-SDR: b+KCI8xM2Ny5l4rA+V7zKGRXWVCcXQ9j+Tf7BmC4A91TJTSw10hXTHKC2/9GGxrig8IEqf2LXE
 /0HxOA1Bh5BQ==
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; d="scan'208";a="387450017"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.45.174])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 08:25:14 -0800
Date: Mon, 25 Jan 2021 17:25:11 +0100 (CET)
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Subject: Re: [PATCH v2 5/9] ALSA: virtio: handling control and I/O messages
 for the PCM device
In-Reply-To: <20210124165408.1122868-6-anton.yakovlev@opensynergy.com>
Message-ID: <e19f65d-9b2b-246-572f-de394ad3662b@intel.com>
References: <20210124165408.1122868-1-anton.yakovlev@opensynergy.com>
 <20210124165408.1122868-6-anton.yakovlev@opensynergy.com>
MIME-Version: 1.0
Cc: virtio-dev@lists.oasis-open.org, alsa-devel@alsa-project.org,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
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


On Sun, 24 Jan 2021, Anton Yakovlev wrote:

> The driver implements a message-based transport for I/O substream
> operations. Before the start of the substream, the hardware buffer is
> sliced into I/O messages, the number of which is equal to the current
> number of periods. The size of each message is equal to the current
> size of one period.
>
> I/O messages are organized in an ordered queue. The completion of the
> I/O message indicates an elapsed period (the only exception is the end
> of the stream for the capture substream). Upon completion, the message
> is automatically re-added to the end of the queue.
>
> Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> ---
> sound/virtio/Makefile         |   3 +-
> sound/virtio/virtio_card.c    |  10 ++
> sound/virtio/virtio_card.h    |   9 +
> sound/virtio/virtio_pcm.c     |   3 +
> sound/virtio/virtio_pcm.h     |  31 ++++
> sound/virtio/virtio_pcm_msg.c | 325 ++++++++++++++++++++++++++++++++++
> 6 files changed, 380 insertions(+), 1 deletion(-)
> create mode 100644 sound/virtio/virtio_pcm_msg.c
>
> diff --git a/sound/virtio/Makefile b/sound/virtio/Makefile
> index 69162a545a41..626af3cc3ed7 100644
> --- a/sound/virtio/Makefile
> +++ b/sound/virtio/Makefile
> @@ -5,5 +5,6 @@ obj-$(CONFIG_SND_VIRTIO) += virtio_snd.o
> virtio_snd-objs := \
> 	virtio_card.o \
> 	virtio_ctl_msg.o \
> -	virtio_pcm.o
> +	virtio_pcm.o \
> +	virtio_pcm_msg.o
>
> diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
> index 39fe13b43dd1..11d025ee77c2 100644
> --- a/sound/virtio/virtio_card.c
> +++ b/sound/virtio/virtio_card.c
> @@ -143,6 +143,12 @@ static int virtsnd_find_vqs(struct virtio_snd *snd)
> 	callbacks[VIRTIO_SND_VQ_CONTROL] = virtsnd_ctl_notify_cb;
> 	callbacks[VIRTIO_SND_VQ_EVENT] = virtsnd_event_notify_cb;
>
> +	virtio_cread(vdev, struct virtio_snd_config, streams, &n);
> +	if (n) {
> +		callbacks[VIRTIO_SND_VQ_TX] = virtsnd_pcm_tx_notify_cb;
> +		callbacks[VIRTIO_SND_VQ_RX] = virtsnd_pcm_rx_notify_cb;
> +	}
> +
> 	rc = virtio_find_vqs(vdev, VIRTIO_SND_VQ_MAX, vqs, callbacks, names,
> 			     NULL);
> 	if (rc) {
> @@ -177,6 +183,10 @@ static int virtsnd_find_vqs(struct virtio_snd *snd)
>  * virtsnd_enable_event_vq() - Enable the event virtqueue.
>  * @snd: VirtIO sound device.
>  *
> + * The tx queue is enabled only if the device supports playback stream(s).
> + *
> + * The rx queue is enabled only if the device supports capture stream(s).
> + *
>  * Context: Any context.
>  */
> static void virtsnd_enable_event_vq(struct virtio_snd *snd)
> diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
> index be6651a6aaf8..b11c09984882 100644
> --- a/sound/virtio/virtio_card.h
> +++ b/sound/virtio/virtio_card.h
> @@ -89,4 +89,13 @@ virtsnd_rx_queue(struct virtio_snd *snd)
> 	return &snd->queues[VIRTIO_SND_VQ_RX];
> }
>
> +static inline struct virtio_snd_queue *
> +virtsnd_pcm_queue(struct virtio_pcm_substream *substream)
> +{
> +	if (substream->direction == SNDRV_PCM_STREAM_PLAYBACK)
> +		return virtsnd_tx_queue(substream->snd);
> +	else
> +		return virtsnd_rx_queue(substream->snd);
> +}
> +
> #endif /* VIRTIO_SND_CARD_H */
> diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
> index 036990b7b78a..1ab50dcc88c8 100644
> --- a/sound/virtio/virtio_pcm.c
> +++ b/sound/virtio/virtio_pcm.c
> @@ -376,6 +376,7 @@ int virtsnd_pcm_parse_cfg(struct virtio_snd *snd)
>
> 		substream->snd = snd;
> 		substream->sid = i;
> +		init_waitqueue_head(&substream->msg_empty);
>
> 		rc = virtsnd_pcm_build_hw(substream, &info[i]);
> 		if (rc)
> @@ -530,6 +531,8 @@ void virtsnd_pcm_event(struct virtio_snd *snd, struct virtio_snd_event *event)
> 		break;
> 	}
> 	case VIRTIO_SND_EVT_PCM_XRUN: {
> +		if (atomic_read(&substream->xfer_enabled))

Why does .xfer_enabled have to be atomic? It only takes two values - 0 and 
1, I don't see any incrementing, or test-and-set type operations or 
anything similar. Also I don't see .xfer_enabled being set to 1 anywhere 
in this patch, presumably that happens in one of later patches.

> +			atomic_set(&substream->xfer_xrun, 1);

Ditto.

> 		break;
> 	}
> 	}
> diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
> index 73fb4d9dc524..d011b7e1d18d 100644
> --- a/sound/virtio/virtio_pcm.h
> +++ b/sound/virtio/virtio_pcm.h
> @@ -24,6 +24,7 @@
> #include <sound/pcm.h>
>
> struct virtio_pcm;
> +struct virtio_pcm_msg;
>
> /**
>  * struct virtio_pcm_substream - VirtIO PCM substream.
> @@ -34,6 +35,16 @@ struct virtio_pcm;
>  * @features: Stream VirtIO feature bit map (1 << VIRTIO_SND_PCM_F_XXX).
>  * @substream: Kernel ALSA substream.
>  * @hw: Kernel ALSA substream hardware descriptor.
> + * @frame_bytes: Current frame size in bytes.
> + * @period_size: Current period size in frames.
> + * @buffer_size: Current buffer size in frames.
> + * @hw_ptr: Substream hardware pointer value in frames [0 ... buffer_size).
> + * @xfer_enabled: Data transfer state (0 - off, 1 - on).
> + * @xfer_xrun: Data underflow/overflow state (0 - no xrun, 1 - xrun).
> + * @msgs: I/O messages.
> + * @msg_last_enqueued: Index of the last I/O message added to the virtqueue.
> + * @msg_count: Number of pending I/O messages in the virtqueue.
> + * @msg_empty: Notify when msg_count is zero.
>  */
> struct virtio_pcm_substream {
> 	struct virtio_snd *snd;
> @@ -43,6 +54,16 @@ struct virtio_pcm_substream {
> 	u32 features;
> 	struct snd_pcm_substream *substream;
> 	struct snd_pcm_hardware hw;
> +	unsigned int frame_bytes;
> +	snd_pcm_uframes_t period_size;
> +	snd_pcm_uframes_t buffer_size;
> +	atomic_t hw_ptr;
> +	atomic_t xfer_enabled;
> +	atomic_t xfer_xrun;
> +	struct virtio_pcm_msg *msgs;
> +	int msg_last_enqueued;
> +	atomic_t msg_count;
> +	wait_queue_head_t msg_empty;
> };
>
> /**
> @@ -86,4 +107,14 @@ struct virtio_pcm *virtsnd_pcm_find(struct virtio_snd *snd, unsigned int nid);
> struct virtio_pcm *virtsnd_pcm_find_or_create(struct virtio_snd *snd,
> 					      unsigned int nid);
>
> +struct virtio_snd_msg *
> +virtsnd_pcm_ctl_msg_alloc(struct virtio_pcm_substream *substream,
> +			  unsigned int command, gfp_t gfp);
> +
> +int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *substream,
> +			  unsigned int nmsg, u8 *dma_area,
> +			  unsigned int period_bytes);
> +
> +int virtsnd_pcm_msg_send(struct virtio_pcm_substream *substream);
> +
> #endif /* VIRTIO_SND_PCM_H */
> diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
> new file mode 100644
> index 000000000000..d524e7cbe43f
> --- /dev/null
> +++ b/sound/virtio/virtio_pcm_msg.c
> @@ -0,0 +1,325 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Sound card driver for virtio
> + * Copyright (C) 2020  OpenSynergy GmbH
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +#include <sound/pcm_params.h>
> +
> +#include "virtio_card.h"
> +
> +/**
> + * enum pcm_msg_sg_index - Scatter-gather element indexes for an I/O message.
> + * @PCM_MSG_SG_XFER: Element containing a virtio_snd_pcm_xfer structure.
> + * @PCM_MSG_SG_DATA: Element containing a data buffer.
> + * @PCM_MSG_SG_STATUS: Element containing a virtio_snd_pcm_status structure.
> + * @PCM_MSG_SG_MAX: The maximum number of elements in the scatter-gather table.
> + *
> + * These values are used as the index of the payload scatter-gather table.
> + */
> +enum pcm_msg_sg_index {
> +	PCM_MSG_SG_XFER = 0,
> +	PCM_MSG_SG_DATA,
> +	PCM_MSG_SG_STATUS,
> +	PCM_MSG_SG_MAX
> +};

If I understand correctly, messages are sent to the back-end driver in 
this specific order, so this is a part of the ABI, isn't it? Is it also a 
part of the spec? If so this should be defined in your ABI header?

> +
> +/**
> + * struct virtio_pcm_msg - VirtIO I/O message.
> + * @substream: VirtIO PCM substream.
> + * @xfer: Request header payload.
> + * @status: Response header payload.
> + * @sgs: Payload scatter-gather table.
> + */
> +struct virtio_pcm_msg {
> +	struct virtio_pcm_substream *substream;
> +	struct virtio_snd_pcm_xfer xfer;
> +	struct virtio_snd_pcm_status status;
> +	struct scatterlist sgs[PCM_MSG_SG_MAX];
> +};
> +
> +/**
> + * virtsnd_pcm_msg_alloc() - Allocate I/O messages.
> + * @substream: VirtIO PCM substream.
> + * @nmsg: Number of messages (equal to the number of periods).
> + * @dma_area: Pointer to used audio buffer.
> + * @period_bytes: Period (message payload) size.
> + *
> + * The function slices the buffer into nmsg parts (each with the size of
> + * period_bytes), and creates nmsg corresponding I/O messages.
> + *
> + * Context: Any context that permits to sleep.
> + * Return: 0 on success, -ENOMEM on failure.
> + */
> +int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *substream,
> +			  unsigned int nmsg, u8 *dma_area,
> +			  unsigned int period_bytes)
> +{
> +	struct virtio_device *vdev = substream->snd->vdev;
> +	unsigned int i;
> +
> +	if (substream->msgs)
> +		devm_kfree(&vdev->dev, substream->msgs);
> +
> +	substream->msgs = devm_kcalloc(&vdev->dev, nmsg,
> +				       sizeof(*substream->msgs), GFP_KERNEL);
> +	if (!substream->msgs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < nmsg; ++i) {
> +		struct virtio_pcm_msg *msg = &substream->msgs[i];
> +
> +		msg->substream = substream;
> +
> +		sg_init_table(msg->sgs, PCM_MSG_SG_MAX);

Why do you need to initialise a table of 3 meddages if you then initialise 
each of them separately immediately below?

> +		sg_init_one(&msg->sgs[PCM_MSG_SG_XFER], &msg->xfer,
> +			    sizeof(msg->xfer));
> +		sg_init_one(&msg->sgs[PCM_MSG_SG_DATA],
> +			    dma_area + period_bytes * i, period_bytes);
> +		sg_init_one(&msg->sgs[PCM_MSG_SG_STATUS], &msg->status,
> +			    sizeof(msg->status));
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * virtsnd_pcm_msg_send() - Send asynchronous I/O messages.
> + * @substream: VirtIO PCM substream.
> + *
> + * All messages are organized in an ordered circular list. Each time the
> + * function is called, all currently non-enqueued messages are added to the
> + * virtqueue. For this, the function keeps track of two values:
> + *
> + *   msg_last_enqueued = index of the last enqueued message,
> + *   msg_count = # of pending messages in the virtqueue.
> + *
> + * Context: Any context.
> + * Return: 0 on success, -EIO on failure.
> + */
> +int virtsnd_pcm_msg_send(struct virtio_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime = substream->substream->runtime;
> +	struct virtio_snd *snd = substream->snd;
> +	struct virtio_device *vdev = snd->vdev;
> +	struct virtqueue *vqueue = virtsnd_pcm_queue(substream)->vqueue;
> +	int i;
> +	int n;
> +	bool notify = false;
> +
> +	if (!vqueue)
> +		return -EIO;

Is this actually possible? That would mean a data corruption or a bug in 
the driver, right? In either case it can be NULL or 1 or any other invalid 
value, so checking for NULL doesn't seem to help a lot?

> +
> +	i = (substream->msg_last_enqueued + 1) % runtime->periods;
> +	n = runtime->periods - atomic_read(&substream->msg_count);
> +
> +	for (; n; --n, i = (i + 1) % runtime->periods) {
> +		struct virtio_pcm_msg *msg = &substream->msgs[i];
> +		struct scatterlist *psgs[PCM_MSG_SG_MAX] = {
> +			[PCM_MSG_SG_XFER] = &msg->sgs[PCM_MSG_SG_XFER],
> +			[PCM_MSG_SG_DATA] = &msg->sgs[PCM_MSG_SG_DATA],
> +			[PCM_MSG_SG_STATUS] = &msg->sgs[PCM_MSG_SG_STATUS]
> +		};
> +		int rc;
> +
> +		msg->xfer.stream_id = cpu_to_virtio32(vdev, substream->sid);
> +		memset(&msg->status, 0, sizeof(msg->status));
> +
> +		atomic_inc(&substream->msg_count);

.msg_count is also accessed in virtsnd_pcm_msg_complete() which is why 
presumably you use atomic access. But here you already increment the count 
before you even begin adding the message to the virtqueue. So if 
virtsnd_pcm_msg_complete() preempts you here the .msg_count will be 
inconsistent? Possibly you need to protect both operations together: 
incrementing the counter and adding messages to queues.

> +
> +		if (substream->direction == SNDRV_PCM_STREAM_PLAYBACK)
> +			rc = virtqueue_add_sgs(vqueue, psgs, 2, 1, msg,
> +					       GFP_ATOMIC);
> +		else
> +			rc = virtqueue_add_sgs(vqueue, psgs, 1, 2, msg,
> +					       GFP_ATOMIC);
> +
> +		if (rc) {
> +			atomic_dec(&substream->msg_count);
> +			return -EIO;
> +		}
> +
> +		substream->msg_last_enqueued = i;
> +	}
> +
> +	if (!(substream->features & (1U << VIRTIO_SND_PCM_F_MSG_POLLING)))
> +		notify = virtqueue_kick_prepare(vqueue);
> +
> +	if (notify)
> +		if (!virtqueue_notify(vqueue))
> +			return -EIO;
> +
> +	return 0;
> +}
> +
> +/**
> + * virtsnd_pcm_msg_complete() - Complete an I/O message.
> + * @msg: I/O message.
> + * @size: Number of bytes written.
> + *
> + * Completion of the message means the elapsed period.
> + *
> + * The interrupt handler modifies three fields of the substream structure
> + * (hw_ptr, xfer_xrun, msg_count) that are used in operator functions. These
> + * values are atomic to avoid frequent interlocks with the interrupt handler.
> + * This becomes especially important in the case of multiple running substreams
> + * that share both the virtqueue and interrupt handler.
> + *
> + * Context: Interrupt context.
> + */
> +static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg, size_t size)
> +{
> +	struct virtio_pcm_substream *substream = msg->substream;
> +	snd_pcm_uframes_t hw_ptr;
> +	unsigned int msg_count;
> +
> +	/*
> +	 * hw_ptr always indicates the buffer position of the first I/O message
> +	 * in the virtqueue. Therefore, on each completion of an I/O message,
> +	 * the hw_ptr value is unconditionally advanced.
> +	 */
> +	hw_ptr = (snd_pcm_uframes_t)atomic_read(&substream->hw_ptr);

Also unclear why this has to be atomic, especially taking into account 
that it's only accessed in "interrupt context."

> +
> +	/*
> +	 * If the capture substream returned an incorrect status, then just
> +	 * increase the hw_ptr by the period size.
> +	 */
> +	if (substream->direction == SNDRV_PCM_STREAM_PLAYBACK ||
> +	    size <= sizeof(msg->status)) {
> +		hw_ptr += substream->period_size;
> +	} else {
> +		size -= sizeof(msg->status);
> +		hw_ptr += size / substream->frame_bytes;
> +	}
> +
> +	atomic_set(&substream->hw_ptr, (u32)(hw_ptr % substream->buffer_size));
> +	atomic_set(&substream->xfer_xrun, 0);
> +
> +	msg_count = atomic_dec_return(&substream->msg_count);
> +
> +	if (atomic_read(&substream->xfer_enabled)) {
> +		struct snd_pcm_runtime *runtime = substream->substream->runtime;
> +
> +		runtime->delay =
> +			bytes_to_frames(runtime,
> +					le32_to_cpu(msg->status.latency_bytes));
> +
> +		snd_pcm_period_elapsed(substream->substream);
> +
> +		virtsnd_pcm_msg_send(substream);
> +	} else if (!msg_count) {
> +		wake_up_all(&substream->msg_empty);
> +	}
> +}

Thanks
Guennadi
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
