Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CE79D405FCA
	for <lists.virtualization@lfdr.de>; Fri, 10 Sep 2021 00:57:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EBC7834F6;
	Thu,  9 Sep 2021 22:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BD2-gTH9Qewp; Thu,  9 Sep 2021 22:57:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D67568499A;
	Thu,  9 Sep 2021 22:57:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 593ACC0022;
	Thu,  9 Sep 2021 22:57:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F20C8C000D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Sep 2021 22:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB9456066E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Sep 2021 22:57:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0BnGgrIAeqFd
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Sep 2021 22:57:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CE00605D6
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Sep 2021 22:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631228272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=APkGG8ErPYnQ8ykZPHEoXBNuNpcZTYwFvdboAedYJZw=;
 b=YPogMpObx0nMY7+C+0D8GcJ4BnNW8SymhS1lYTPXUMJMxjidvb7ZBFQLK+TEPhqXAsIcaH
 wypUlvL1Qjl3H76hUUOLwYS3/oLcUE5RShS5p69XjUf9TH+9gprZT1FPmcJ4mMjeRTb+3B
 /YO3oQjuHO9ezuPsc/nFB6bOpWH3grc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-KtV8_TNZOBqAKKqd8bYIoQ-1; Thu, 09 Sep 2021 18:57:51 -0400
X-MC-Unique: KtV8_TNZOBqAKKqd8bYIoQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 e6-20020a056402088600b003c73100e376so1760262edy.17
 for <virtualization@lists.linux-foundation.org>;
 Thu, 09 Sep 2021 15:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=APkGG8ErPYnQ8ykZPHEoXBNuNpcZTYwFvdboAedYJZw=;
 b=GIw7myVYub/GgPAhHyalmhkEdXSGk0EbrpDkSct2OoBC3s6au133sGN3RvkHlf/BqY
 ZvAFyoALMHPtUWTq2EFD+0x7B8WB4pCSNa2J5XBno1bObZHuPNtG7zFwwet1tTJOYvSL
 jIunjr5pmla1MKl1P9bE/2wqjQDXOWl7hXUE+xW2Oup0V/6M5gh5x136TNs9QQC3x9NJ
 h+b2b0Eh5bRSPbRpl1mTrk7o/vWpIzXmYJOLZMmEbVrcJbU4TlBatNeNXUipiU37z8e4
 QyVkhQsv2svX1a/YAKxrbJrRq3Y+/c5D4XGX6oK6BULmx/Q92qiTTwTtqYMD+xtp6i1/
 zFHA==
X-Gm-Message-State: AOAM533/D0V4ymbqweB0aazYyaM1NmdBRJI47DxIPUlZiXT7KtWInEz2
 agVkkoKBH8CIldN5Y148Sg5kfnr5XFRDCzLQRAQIXngZDnvax2W7vFYC5pQ1S1mB4XyaG/11YIb
 OQxyCLgSXjo9eiok/To/hjhEdB/sPFR8LyPJBvwAvEQ==
X-Received: by 2002:a17:906:49d0:: with SMTP id
 w16mr2951643ejv.455.1631228269814; 
 Thu, 09 Sep 2021 15:57:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyC+kKpcaXs7jdE4lf8UXFzG7SXP2nMwDuXsMi4r9a50qENePUfLnY3iZOvdfHAfMhvQlkExg==
X-Received: by 2002:a17:906:49d0:: with SMTP id
 w16mr2951628ejv.455.1631228269611; 
 Thu, 09 Sep 2021 15:57:49 -0700 (PDT)
Received: from redhat.com ([2.55.145.189])
 by smtp.gmail.com with ESMTPSA id t19sm1506493ejb.115.2021.09.09.15.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 15:57:48 -0700 (PDT)
Date: Thu, 9 Sep 2021 18:57:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: Re: [PATCH v2 1/1] virtio-blk: add num_io_queues module parameter
Message-ID: <20210909185525-mutt-send-email-mst@kernel.org>
References: <20210905120234-mutt-send-email-mst@kernel.org>
 <98309fcd-3abe-1f27-fe52-e8fcc58bec13@nvidia.com>
 <20210906071957-mutt-send-email-mst@kernel.org>
 <1cbbe6e2-1473-8696-565c-518fc1016a1a@nvidia.com>
 <20210909094001-mutt-send-email-mst@kernel.org>
 <456e1704-67e9-aac9-a82a-44fed65dd153@nvidia.com>
 <20210909114029-mutt-send-email-mst@kernel.org>
 <da61fec0-e90f-0020-c836-c2e58d32be27@nvidia.com>
 <20210909123035-mutt-send-email-mst@kernel.org>
 <0cd4ab50-1bb2-3baf-fc00-b2045e8f8eb1@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <0cd4ab50-1bb2-3baf-fc00-b2045e8f8eb1@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, kvm@vger.kernel.org,
 israelr@nvidia.com, virtualization@lists.linux-foundation.org,
 hch@infradead.org, nitzanc@nvidia.com, Stefan Hajnoczi <stefanha@redhat.com>,
 oren@nvidia.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, Sep 09, 2021 at 07:45:42PM +0300, Max Gurtovoy wrote:
> 
> On 9/9/2021 7:31 PM, Michael S. Tsirkin wrote:
> > On Thu, Sep 09, 2021 at 06:51:56PM +0300, Max Gurtovoy wrote:
> > > On 9/9/2021 6:40 PM, Michael S. Tsirkin wrote:
> > > > On Thu, Sep 09, 2021 at 06:37:37PM +0300, Max Gurtovoy wrote:
> > > > > On 9/9/2021 4:42 PM, Michael S. Tsirkin wrote:
> > > > > > On Mon, Sep 06, 2021 at 02:59:40PM +0300, Max Gurtovoy wrote:
> > > > > > > On 9/6/2021 2:20 PM, Michael S. Tsirkin wrote:
> > > > > > > > On Mon, Sep 06, 2021 at 01:31:32AM +0300, Max Gurtovoy wrote:
> > > > > > > > > On 9/5/2021 7:02 PM, Michael S. Tsirkin wrote:
> > > > > > > > > > On Thu, Sep 02, 2021 at 02:45:52PM +0100, Stefan Hajnoczi wrote:
> > > > > > > > > > > On Tue, Aug 31, 2021 at 04:50:35PM +0300, Max Gurtovoy wrote:
> > > > > > > > > > > > Sometimes a user would like to control the amount of IO queues to be
> > > > > > > > > > > > created for a block device. For example, for limiting the memory
> > > > > > > > > > > > footprint of virtio-blk devices.
> > > > > > > > > > > > 
> > > > > > > > > > > > Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> > > > > > > > > > > > ---
> > > > > > > > > > > > 
> > > > > > > > > > > > changes from v1:
> > > > > > > > > > > >       - use param_set_uint_minmax (from Christoph)
> > > > > > > > > > > >       - added "Should > 0" to module description
> > > > > > > > > > > > 
> > > > > > > > > > > > Note: This commit apply on top of Jens's branch for-5.15/drivers
> > > > > > > > > > > > ---
> > > > > > > > > > > >       drivers/block/virtio_blk.c | 20 +++++++++++++++++++-
> > > > > > > > > > > >       1 file changed, 19 insertions(+), 1 deletion(-)
> > > > > > > > > > > > 
> > > > > > > > > > > > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> > > > > > > > > > > > index 4b49df2dfd23..9332fc4e9b31 100644
> > > > > > > > > > > > --- a/drivers/block/virtio_blk.c
> > > > > > > > > > > > +++ b/drivers/block/virtio_blk.c
> > > > > > > > > > > > @@ -24,6 +24,22 @@
> > > > > > > > > > > >       /* The maximum number of sg elements that fit into a virtqueue */
> > > > > > > > > > > >       #define VIRTIO_BLK_MAX_SG_ELEMS 32768
> > > > > > > > > > > > +static int virtblk_queue_count_set(const char *val,
> > > > > > > > > > > > +		const struct kernel_param *kp)
> > > > > > > > > > > > +{
> > > > > > > > > > > > +	return param_set_uint_minmax(val, kp, 1, nr_cpu_ids);
> > > > > > > > > > > > +}
> > > > > > > > Hmm which tree is this for?
> > > > > > > I've mentioned in the note that it apply on branch for-5.15/drivers. But now
> > > > > > > you can apply it on linus/master as well.
> > > > > > > 
> > > > > > > 
> > > > > > > > > > > > +
> > > > > > > > > > > > +static const struct kernel_param_ops queue_count_ops = {
> > > > > > > > > > > > +	.set = virtblk_queue_count_set,
> > > > > > > > > > > > +	.get = param_get_uint,
> > > > > > > > > > > > +};
> > > > > > > > > > > > +
> > > > > > > > > > > > +static unsigned int num_io_queues;
> > > > > > > > > > > > +module_param_cb(num_io_queues, &queue_count_ops, &num_io_queues, 0644);
> > > > > > > > > > > > +MODULE_PARM_DESC(num_io_queues,
> > > > > > > > > > > > +		 "Number of IO virt queues to use for blk device. Should > 0");
> > > > > > > > better:
> > > > > > > > 
> > > > > > > > +MODULE_PARM_DESC(num_io_request_queues,
> > > > > > > > +                "Limit number of IO request virt queues to use for each device. 0 for now limit");
> > > > > > > You proposed it and I replied on it bellow.
> > > > > > Can't say I understand 100% what you are saying. Want to send
> > > > > > a description that does make sense to you but
> > > > > > also reflects reality? 0 is the default so
> > > > > > "should > 0" besides being ungrammatical does not seem t"
> > > > > > reflect what it does ...
> > > > > if you "modprobe virtio_blk" the previous behavior will happen.
> > > > > 
> > > > > You can't "modprobe virtio_blk num_io_request_queues=0" since the minimal
> > > > > value is 1.
> > > > > 
> > > > > So your description is not reflecting the code.
> > > > > 
> > > > > We can do:
> > > > > 
> > > > > MODULE_PARM_DESC(num_io_request_queues, "Number of request virt queues to use for blk device. Minimum value is 1 queue");
> > > > What's the default value? We should document that.
> > > default value for static global variables is 0.
> > > 
> > > MODULE_PARM_DESC(num_io_request_queues, "Number of request virt queues to
> > > use for blk device. Minimum value is 1 queue. Default and Maximum value is
> > > equal to the total number of CPUs");
> > So it says it's the # of cpus but yoiu inspect it with
> > sysfs and it's actually 0. Let's say that's confusing
> > at the least. why not just let users set it to 0
> > and document that?
> > 
> Setting it by the user to 0 makes no sense.
> 
> We can say "if not set, the value equals to the total number of CPUs".

the value is 0. it seems to mean "no limit". the actual # of queues is
then te smaller between # of cpus and # of hardware queues.
I see no reason not to allow user to set that especially if
it was originally the value then user changed it
and is trying to change it back.

> The actual value of the created queues can be seen in /sys/block/vda/mq/ as
> done today.

> > > > > > > > > > > > +
> > > > > > > > > > > >       static int major;
> > > > > > > > > > > >       static DEFINE_IDA(vd_index_ida);
> > > > > > > > > > > > @@ -501,7 +517,9 @@ static int init_vq(struct virtio_blk *vblk)
> > > > > > > > > > > >       	if (err)
> > > > > > > > > > > >       		num_vqs = 1;
> > > > > > > > > > > > -	num_vqs = min_t(unsigned int, nr_cpu_ids, num_vqs);
> > > > > > > > > > > > +	num_vqs = min_t(unsigned int,
> > > > > > > > > > > > +			min_not_zero(num_io_queues, nr_cpu_ids),
> > > > > > > > > > > > +			num_vqs);
> > > > > > > > > > > If you respin, please consider calling them request queues. That's the
> > > > > > > > > > > terminology from the VIRTIO spec and it's nice to keep it consistent.
> > > > > > > > > > > But the purpose of num_io_queues is clear, so:
> > > > > > > > > > > 
> > > > > > > > > > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > > > > > > > I did this:
> > > > > > > > > > +static unsigned int num_io_request_queues;
> > > > > > > > > > +module_param_cb(num_io_request_queues, &queue_count_ops, &num_io_request_queues, 0644);
> > > > > > > > > > +MODULE_PARM_DESC(num_io_request_queues,
> > > > > > > > > > +                "Limit number of IO request virt queues to use for each device. 0 for now limit");
> > > > > > > > > The parameter is writable and can be changed and then new devices might be
> > > > > > > > > probed with new value.
> > > > > > > > > 
> > > > > > > > > It can't be zero in the code. we can change param_set_uint_minmax args and
> > > > > > > > > say that 0 says nr_cpus.
> > > > > > > > > 
> > > > > > > > > I'm ok with the renaming but I prefer to stick to the description we gave in
> > > > > > > > > V3 of this patch (and maybe enable value of 0 as mentioned above).

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
