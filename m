Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEAE17F613
	for <lists.virtualization@lfdr.de>; Tue, 10 Mar 2020 12:19:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8DCBC8632D;
	Tue, 10 Mar 2020 11:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7KbDP5mmVZcc; Tue, 10 Mar 2020 11:19:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1351586168;
	Tue, 10 Mar 2020 11:19:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03E06C0177;
	Tue, 10 Mar 2020 11:19:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D990DC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C7B2A8832D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:19:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wnNA0VjJ7A7x
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:19:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A590B87FEA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583839164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qfsU9Bh+9ERXSvjXe/Jnk6fWHOirWhBhsnum3jMiYw8=;
 b=VpxfH9xCfCaBgIZpeBibodLU39T+Z9rrYfDhdSqRh2sBE4f0kh+HoG29znNzJs8zDppTgA
 7AhNLMxF5rC1QsMOcauP06cfiXzj7HmVpusZSs4dYw3yhWkxwE5akUlbB4Bc5+fXMpydXk
 DDr324GUg2Fvbx9Cx8zA1kXITn/KBU8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-LXaw-rYSOrOlPcjqx7a1kg-1; Tue, 10 Mar 2020 07:19:20 -0400
X-MC-Unique: LXaw-rYSOrOlPcjqx7a1kg-1
Received: by mail-qk1-f199.google.com with SMTP id b82so2468403qkc.11
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 04:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qfsU9Bh+9ERXSvjXe/Jnk6fWHOirWhBhsnum3jMiYw8=;
 b=rOPwgXHgBQkCOFovdvFX8M/GIHKBbTqc4YtV4yCX+QUe68cJr7yapBx977bhhxlWTd
 9J2nSkyKYXOk3fmzAoi9f+CLIa1mixRtmTgDU7bLLMlKy9g2JnqQyxdQIsN9MWNSaDEi
 32lHr3fqU0oZ+qJ/iSonmW9ShUsONBG4aB0MSfqgA0otKs2x3rYKu20aRMxNJ2YeEzrL
 DnVAE32SEuAXUgZ59drSgmTD11hYmyatHJPySwC6IWjcIX2BvEFHNGqKAGrg03RQE6v4
 ZhRitoyN/XqWnVHbCYU1a5npe5zzGXMZfqGUriNQlrFL+rsL9BlHtIihsDjYmnilJhUi
 PXPQ==
X-Gm-Message-State: ANhLgQ2HLG5DvPjAyWkqwjM5KqVXTR8ODFpFXtwKc5BcbHXAdev4VKcA
 QbFXfQBh6IufofZkj8/baWaYe4VSPfDgNJZzasx9njYljJMJHUEI4mOmWfSGerpCnrgp5tw315b
 3lq8dsgiFlakzzt5NE8kW2BhpteuGxU5FrAsHKRbB2Q==
X-Received: by 2002:a37:4141:: with SMTP id o62mr18336375qka.282.1583839160114; 
 Tue, 10 Mar 2020 04:19:20 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvFQXTyeq0C9+jsN/NWv2w1PTOeNblibyZ7JGEqrKf11uCaqcYvWES5T61GOlUp4h635fOhPA==
X-Received: by 2002:a37:4141:: with SMTP id o62mr18336356qka.282.1583839159836; 
 Tue, 10 Mar 2020 04:19:19 -0700 (PDT)
Received: from redhat.com (bzq-79-178-2-19.red.bezeqint.net. [79.178.2.19])
 by smtp.gmail.com with ESMTPSA id e130sm23973211qkb.72.2020.03.10.04.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 04:19:18 -0700 (PDT)
Date: Tue, 10 Mar 2020 07:19:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
Message-ID: <20200310071844-mutt-send-email-mst@kernel.org>
References: <20200310103903.6014-1-david@redhat.com>
 <20200310070413-mutt-send-email-mst@kernel.org>
 <78427916-fc17-b081-6b1e-cbcb00d51752@redhat.com>
MIME-Version: 1.0
In-Reply-To: <78427916-fc17-b081-6b1e-cbcb00d51752@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Tyler Sanderson <tysand@google.com>,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
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

On Tue, Mar 10, 2020 at 12:12:50PM +0100, David Hildenbrand wrote:
> >>  static void virtio_balloon_unregister_shrinker(struct virtio_balloon *vb)
> >> @@ -971,7 +950,22 @@ static int virtballoon_probe(struct virtio_device *vdev)
> >>  						  VIRTIO_BALLOON_CMD_ID_STOP);
> >>  		spin_lock_init(&vb->free_page_list_lock);
> >>  		INIT_LIST_HEAD(&vb->free_page_list);
> >> +		/*
> >> +		 * We're allowed to reuse any free pages, even if they are
> >> +		 * still to be processed by the host.
> >> +		 */
> >> +		err = virtio_balloon_register_shrinker(vb);
> >> +		if (err)
> >> +			goto out_del_balloon_wq;
> >>  	}
> >> +	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM)) {
> >> +		vb->oom_nb.notifier_call = virtio_balloon_oom_notify;
> >> +		vb->oom_nb.priority = VIRTIO_BALLOON_OOM_NOTIFY_PRIORITY;
> >> +		err = register_oom_notifier(&vb->oom_nb);
> >> +		if (err < 0)
> >> +			goto out_unregister_shrinker;
> >> +	}
> >> +
> > 
> > 
> > Let's decide whether we want an empty line after }, or not, and stick to
> > it. I prefer an empty line but no biggie as long as we are consistent.
> 
> Can add one.
> 
> > 
> >>  	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_PAGE_POISON)) {
> >>  		/* Start with poison val of 0 representing general init */
> >>  		__u32 poison_val = 0;
> >> @@ -986,15 +980,6 @@ static int virtballoon_probe(struct virtio_device *vdev)
> >>  		virtio_cwrite(vb->vdev, struct virtio_balloon_config,
> >>  			      poison_val, &poison_val);
> >>  	}
> >> -	/*
> >> -	 * We continue to use VIRTIO_BALLOON_F_DEFLATE_ON_OOM to decide if a
> >> -	 * shrinker needs to be registered to relieve memory pressure.
> >> -	 */
> >> -	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM)) {
> >> -		err = virtio_balloon_register_shrinker(vb);
> >> -		if (err)
> >> -			goto out_del_balloon_wq;
> >> -	}
> >>  
> >>  	vb->pr_dev_info.report = virtballoon_free_page_report;
> >>  	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_REPORTING)) {
> >> @@ -1003,12 +988,12 @@ static int virtballoon_probe(struct virtio_device *vdev)
> >>  		capacity = virtqueue_get_vring_size(vb->reporting_vq);
> >>  		if (capacity < PAGE_REPORTING_CAPACITY) {
> >>  			err = -ENOSPC;
> >> -			goto out_unregister_shrinker;
> >> +			goto out_unregister_oom;
> >>  		}
> >>  
> >>  		err = page_reporting_register(&vb->pr_dev_info);
> >>  		if (err)
> >> -			goto out_unregister_shrinker;
> >> +			goto out_unregister_oom;
> >>  	}
> >>  
> >>  	virtio_device_ready(vdev);
> >> @@ -1017,8 +1002,11 @@ static int virtballoon_probe(struct virtio_device *vdev)
> >>  		virtballoon_changed(vdev);
> >>  	return 0;
> >>  
> >> +out_unregister_oom:
> >> +	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
> >> +		unregister_oom_notifier(&vb->oom_nb);
> >>  out_unregister_shrinker:
> >> -	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
> >> +	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
> >>  		virtio_balloon_unregister_shrinker(vb);
> > 
> > 
> > What's with vdev versus vb->vdev here?
> > I suggest we keep using vb->vdev to make the patch minimal if we can.
> > Same elsewhere.
> 
> As we touch this line either way, does it really make a difference? No
> strong opinion. Can just do a vb->vdev and clean this up globally later.
> 

Let's just be consistent. I guess that means keep using vb->vdev
everywhere.

> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
