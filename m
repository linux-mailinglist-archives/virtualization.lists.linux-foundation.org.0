Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AEF17F61B
	for <lists.virtualization@lfdr.de>; Tue, 10 Mar 2020 12:20:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 30CE088332;
	Tue, 10 Mar 2020 11:20:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rUOdNTWsxO58; Tue, 10 Mar 2020 11:20:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8E97B87FEA;
	Tue, 10 Mar 2020 11:20:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74F50C0177;
	Tue, 10 Mar 2020 11:20:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A5FFC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 36FB92044F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:20:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gaHtuL1dUUqz
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:20:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 399C21FB6B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583839248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GdVuc9bDDGHvyHDl3iZh6HgXHzBZaac/Yra+QM5W/hE=;
 b=Uo/FcNWI4IvH/RIAW6QakCfTyCFs+usq2aozgkfKgTB3D06wblbw7fWOGIllzm3UvAjxyJ
 GJIRvCb5lUnuZGATDb29omXqZN0saNc9YV43paZy/MpoaCXoISfnD5g4piCLaEDmWhaaGt
 E1jYn5xEBMHQVZmcHT2eNdEkrSMwPds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-FCPBD8E8NIODu9xpGVJgJw-1; Tue, 10 Mar 2020 07:20:45 -0400
X-MC-Unique: FCPBD8E8NIODu9xpGVJgJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CD1E10120DD;
 Tue, 10 Mar 2020 11:20:42 +0000 (UTC)
Received: from [10.36.118.8] (unknown [10.36.118.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 389DF10013A1;
 Tue, 10 Mar 2020 11:20:37 +0000 (UTC)
Subject: Re: [PATCH v2] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200310103903.6014-1-david@redhat.com>
 <20200310070413-mutt-send-email-mst@kernel.org>
 <78427916-fc17-b081-6b1e-cbcb00d51752@redhat.com>
 <20200310071844-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <cf819bce-0480-bef1-cfe4-367893795ed5@redhat.com>
Date: Tue, 10 Mar 2020 12:20:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310071844-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

On 10.03.20 12:19, Michael S. Tsirkin wrote:
> On Tue, Mar 10, 2020 at 12:12:50PM +0100, David Hildenbrand wrote:
>>>>  static void virtio_balloon_unregister_shrinker(struct virtio_balloon *vb)
>>>> @@ -971,7 +950,22 @@ static int virtballoon_probe(struct virtio_device *vdev)
>>>>  						  VIRTIO_BALLOON_CMD_ID_STOP);
>>>>  		spin_lock_init(&vb->free_page_list_lock);
>>>>  		INIT_LIST_HEAD(&vb->free_page_list);
>>>> +		/*
>>>> +		 * We're allowed to reuse any free pages, even if they are
>>>> +		 * still to be processed by the host.
>>>> +		 */
>>>> +		err = virtio_balloon_register_shrinker(vb);
>>>> +		if (err)
>>>> +			goto out_del_balloon_wq;
>>>>  	}
>>>> +	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM)) {
>>>> +		vb->oom_nb.notifier_call = virtio_balloon_oom_notify;
>>>> +		vb->oom_nb.priority = VIRTIO_BALLOON_OOM_NOTIFY_PRIORITY;
>>>> +		err = register_oom_notifier(&vb->oom_nb);
>>>> +		if (err < 0)
>>>> +			goto out_unregister_shrinker;
>>>> +	}
>>>> +
>>>
>>>
>>> Let's decide whether we want an empty line after }, or not, and stick to
>>> it. I prefer an empty line but no biggie as long as we are consistent.
>>
>> Can add one.
>>
>>>
>>>>  	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_PAGE_POISON)) {
>>>>  		/* Start with poison val of 0 representing general init */
>>>>  		__u32 poison_val = 0;
>>>> @@ -986,15 +980,6 @@ static int virtballoon_probe(struct virtio_device *vdev)
>>>>  		virtio_cwrite(vb->vdev, struct virtio_balloon_config,
>>>>  			      poison_val, &poison_val);
>>>>  	}
>>>> -	/*
>>>> -	 * We continue to use VIRTIO_BALLOON_F_DEFLATE_ON_OOM to decide if a
>>>> -	 * shrinker needs to be registered to relieve memory pressure.
>>>> -	 */
>>>> -	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM)) {
>>>> -		err = virtio_balloon_register_shrinker(vb);
>>>> -		if (err)
>>>> -			goto out_del_balloon_wq;
>>>> -	}
>>>>  
>>>>  	vb->pr_dev_info.report = virtballoon_free_page_report;
>>>>  	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_REPORTING)) {
>>>> @@ -1003,12 +988,12 @@ static int virtballoon_probe(struct virtio_device *vdev)
>>>>  		capacity = virtqueue_get_vring_size(vb->reporting_vq);
>>>>  		if (capacity < PAGE_REPORTING_CAPACITY) {
>>>>  			err = -ENOSPC;
>>>> -			goto out_unregister_shrinker;
>>>> +			goto out_unregister_oom;
>>>>  		}
>>>>  
>>>>  		err = page_reporting_register(&vb->pr_dev_info);
>>>>  		if (err)
>>>> -			goto out_unregister_shrinker;
>>>> +			goto out_unregister_oom;
>>>>  	}
>>>>  
>>>>  	virtio_device_ready(vdev);
>>>> @@ -1017,8 +1002,11 @@ static int virtballoon_probe(struct virtio_device *vdev)
>>>>  		virtballoon_changed(vdev);
>>>>  	return 0;
>>>>  
>>>> +out_unregister_oom:
>>>> +	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
>>>> +		unregister_oom_notifier(&vb->oom_nb);
>>>>  out_unregister_shrinker:
>>>> -	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
>>>> +	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
>>>>  		virtio_balloon_unregister_shrinker(vb);
>>>
>>>
>>> What's with vdev versus vb->vdev here?
>>> I suggest we keep using vb->vdev to make the patch minimal if we can.
>>> Same elsewhere.
>>
>> As we touch this line either way, does it really make a difference? No
>> strong opinion. Can just do a vb->vdev and clean this up globally later.
>>
> 
> Let's just be consistent. I guess that means keep using vb->vdev
> everywhere.

It's already really inconsistent, so I'll use vb->vdev in this patch and
cleanup the other users later.

-- 
Thanks,

David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
