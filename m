Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D69412B6BE4
	for <lists.virtualization@lfdr.de>; Tue, 17 Nov 2020 18:38:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8093186F98;
	Tue, 17 Nov 2020 17:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Njw1G2JskoQ; Tue, 17 Nov 2020 17:38:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D898586F9A;
	Tue, 17 Nov 2020 17:38:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CACFDC07FF;
	Tue, 17 Nov 2020 17:38:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1C5BC07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 17:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CE1688636A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 17:38:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C-nfezEraHmm
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 17:38:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1EC3E862DE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 17:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605634698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z3zMU/irHlYxEEE6FnqPEHkVQnZNhU8YfF5u9aF7C6Y=;
 b=gwVkP3jjyCdaSp8WNPaOKvFRXVGnHvs+tiEN52Egqn6/xryZzEJZOvxiCzRv+ZMPrYywUI
 L8GlGeYdBNCBY39JYRzDrbaMVxtDWA0joX1agnpRGG42BzKZeyYYgs4oSKOTeNGsauie+c
 7SfWgUWgmt6pMkLmcbL2mcjmtEbS2II=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-JEhony-fOIm2f4Ha2HdhHA-1; Tue, 17 Nov 2020 12:38:16 -0500
X-MC-Unique: JEhony-fOIm2f4Ha2HdhHA-1
Received: by mail-wm1-f70.google.com with SMTP id z62so1597702wmb.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 09:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z3zMU/irHlYxEEE6FnqPEHkVQnZNhU8YfF5u9aF7C6Y=;
 b=fb7dI8ScXFjC0tFPga4OA2p+Fv5lppPh7uWi/AZCFRbihKsY4CeWumqsJE/R93Mt7g
 r5zufHQjRKi8+4nKvE45GPR5GwagZZEfv1SKqUrEBzZzUmKmYu0zW9Lwi1HMYRwi78r5
 L0YMfAiMZ8yKFR2KUbhwJ9gsl+KrploA30OB00CDC8aUGdutkT6q8i1mlkIwYWROSFVt
 paGwympHYXRAcAhGcAL2m6MD5MLF/HlcZZxww6R6qFXCF1Q58CsDd5qT21gMYVR36gox
 ikC1W8UT465zJ4i8XPuuS/GVutk8v0KW6jzySl+evaC/cLu84WxP9V/cqv+qMga15i3p
 4eMw==
X-Gm-Message-State: AOAM5330bMQg0fh92ue1v0YdVCuqP+o1waT7+96jWcPxXB8ceK0AJVAL
 CGCaaIrP5BhmUGoKwaJEwfqLFc9ycPnE5ZRkq7o6ZLkAC44jyFGAtg10TPxNsYzQGNwB0RIYN3D
 Zvwiyl5Z6DsrM6kpbi2kx4b8+SM4yuUsCYbOSM5uUUg==
X-Received: by 2002:adf:8304:: with SMTP id 4mr615936wrd.215.1605634694933;
 Tue, 17 Nov 2020 09:38:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwdJ6+EaN9QGoIcD75zlLRHiDRmAV9Png2NohLzSTCxLdpVgipQWF3mLG37OL/b0dc/u/QeA==
X-Received: by 2002:adf:8304:: with SMTP id 4mr615917wrd.215.1605634694710;
 Tue, 17 Nov 2020 09:38:14 -0800 (PST)
Received: from steredhat (host-79-17-248-175.retail.telecomitalia.it.
 [79.17.248.175])
 by smtp.gmail.com with ESMTPSA id p21sm4228345wma.41.2020.11.17.09.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:38:13 -0800 (PST)
Date: Tue, 17 Nov 2020 18:38:11 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC 04/12] vdpa: add vdpa simulator for block device
Message-ID: <20201117173811.lw4nwicoykhnn3tt@steredhat>
References: <20201113134712.69744-1-sgarzare@redhat.com>
 <20201113134712.69744-5-sgarzare@redhat.com>
 <20201117111121.GD131917@stefanha-x1.localdomain>
 <20201117141620.ytium7r6xpxi4and@steredhat>
 <20201117164342.GT131917@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201117164342.GT131917@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Eli Cohen <elic@nvidia.com>
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

On Tue, Nov 17, 2020 at 04:43:42PM +0000, Stefan Hajnoczi wrote:
>On Tue, Nov 17, 2020 at 03:16:20PM +0100, Stefano Garzarella wrote:
>> On Tue, Nov 17, 2020 at 11:11:21AM +0000, Stefan Hajnoczi wrote:
>> > On Fri, Nov 13, 2020 at 02:47:04PM +0100, Stefano Garzarella wrote:
>> > > +static void vdpasim_blk_work(struct work_struct *work)
>> > > +{
>> > > +	struct vdpasim *vdpasim = container_of(work, struct vdpasim, work);
>> > > +	u8 status = VIRTIO_BLK_S_OK;
>> > > +	int i;
>> > > +
>> > > +	spin_lock(&vdpasim->lock);
>> > > +
>> > > +	if (!(vdpasim->status & VIRTIO_CONFIG_S_DRIVER_OK))
>> > > +		goto out;
>> > > +
>> > > +	for (i = 0; i < VDPASIM_BLK_VQ_NUM; i++) {
>> > > +		struct vdpasim_virtqueue *vq = &vdpasim->vqs[i];
>> > > +
>> > > +		if (!vq->ready)
>> > > +			continue;
>> > > +
>> > > +		while (vringh_getdesc_iotlb(&vq->vring, &vq->iov, &vq->iov,
>> > > +					    &vq->head, GFP_ATOMIC) > 0) {
>> > > +
>> > > +			int write;
>> > > +
>> > > +			vq->iov.i = vq->iov.used - 1;
>> > > +			write = vringh_iov_push_iotlb(&vq->vring, &vq->iov, &status, 1);
>> > > +			if (write <= 0)
>> > > +				break;
>> >
>> > We're lucky the guest driver doesn't crash after VIRTIO_BLK_T_GET_ID? :)
>>
>> The crash could happen if the simulator doesn't put the string terminator,
>> but in virtio_blk.c, the serial_show() initialize the buffer putting the
>> string terminator in the VIRTIO_BLK_ID_BYTES element:
>>
>>     buf[VIRTIO_BLK_ID_BYTES] = '\0';
>>     err = virtblk_get_id(disk, buf);
>>
>> This should prevent the issue, right?
>>
>> However in the last patch of this series I implemented VIRTIO_BLK_T_GET_ID
>> support :-)
>
>Windows, BSD, macOS, etc guest drivers aren't necessarily going to
>terminate or initialize the serial string buffer.

Unfortunately I discovered that VIRTIO_BLK_T_GET_ID is not in the VIRTIO 
specs, so, just for curiosity, I checked the QEMU code and I found this:

     case VIRTIO_BLK_T_GET_ID:
     {
         /*
          * NB: per existing s/n string convention the string is
          * terminated by '\0' only when shorter than buffer.
          */
         const char *serial = s->conf.serial ? s->conf.serial : "";
         size_t size = MIN(strlen(serial) + 1,
                           MIN(iov_size(in_iov, in_num),
                               VIRTIO_BLK_ID_BYTES));
         iov_from_buf(in_iov, in_num, 0, serial, size);
         virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
         virtio_blk_free_request(req);
         break;
     }

It seems that the device emulation in QEMU expects that the driver 
terminates the serial string buffer.

Do you know why VIRTIO_BLK_T_GET_ID is not in the specs?
Should we add it?

Thanks,
Stefano

>
>Anyway, the later patch that implements VIRTIO_BLK_T_GET_ID solves this
>issue! Thanks.

>
>Stefan


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
