Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 295EB22739
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:21:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AC130A7A;
	Sun, 19 May 2019 16:17:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6EF41C9B
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 19:05:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0F3BA8A9
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 19:05:42 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id y11so478013pfm.13
	for <virtualization@lists.linux-foundation.org>;
	Wed, 08 May 2019 12:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Xx1nBdwm/fMIaQ+XRMTVvJx4homKW8vOYVCrjJQah8c=;
	b=u2CwdPBWUhvunu491lhDVH7O10yitnzRdNYTDcNKNGaaMw+pYsmkpn0J9MsT99d39Y
	Q/Wk7PGyXcjoc1tha4UuyE89T0rOnD72kAWNnjYRKkjCa0DELX1ElQVVB5fGF3jmFGkX
	uLZw9HuRYb+PEeZ/PPFrro1K3Iw9vCnd+ELZuZL2OKCDNAb8u9QKbTbbytR8kbwE4FBI
	Zo/dlYVRRbaMO0EpBIfmHWL9EiKzdxDQc7t8r9e2EKWR9k2JLXoh6H4LfMbZMUTXsaF+
	muQoMtmzSSBP8hE/rlSXFu27Me96rPxVPBbMGgvYpGy27lg+hjZKYMbf9BMngu5WO2ck
	kXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Xx1nBdwm/fMIaQ+XRMTVvJx4homKW8vOYVCrjJQah8c=;
	b=tE3mrXsnZeWsyvohOIv40Cx/61A3DOogii0VevjpEVjex2JgMnefPB0HRXZ0xjql5U
	HKmTC6mYbbnlx6P8Eo+/MkTQY1BSfCuv2PkBbRUSIoAN2eTw2vNoYiOFY19mxtKMR5eI
	rbxXRq0nKdtOHgoVwgZ3Aof1t4WS28Eecdh/1wdH5a/nBnTYh16UR4nen2gkmi1UUUvx
	SQUp0oI5NzKdIwdIchew1FP8rH0BwV0Jy3bPEwmAXCfQoWfHEOCUBSLcYEEuit2Sf9kE
	pCcY/DZ6JoWgOqxA99io5SJPXyDWMUUHFwSdZik7Wt63L7O8MGty0pqXd5wno3j3QOpo
	OJYg==
X-Gm-Message-State: APjAAAXu+KSLguVbIvYh3+jpBXtJU2ZVks2/lnyatwq7K0DBZbK+yRt8
	l5ss8/RVkpxAv0OBAnqU/f3aDA==
X-Google-Smtp-Source: APXvYqzypNLQt7uc54cFtZOQcJp0DaX+ClanYsAzKwneRj68EqOnfHTAe97HizrDj+ZvHjUmPOl5NA==
X-Received: by 2002:a65:5cc8:: with SMTP id b8mr47363166pgt.36.1557342342253; 
	Wed, 08 May 2019 12:05:42 -0700 (PDT)
Received: from jstaron2.mtv.corp.google.com
	([2620:15c:202:201:b94f:2527:c39f:ca2d])
	by smtp.gmail.com with ESMTPSA id
	129sm23470533pff.140.2019.05.08.12.05.40
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 12:05:41 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v7 2/6] virtio-pmem: Add virtio pmem driver
To: Pankaj Gupta <pagupta@redhat.com>
References: <20190426050039.17460-1-pagupta@redhat.com>
	<20190426050039.17460-3-pagupta@redhat.com>
	<3d6479ae-6c39-d614-f1d9-aa1978e2e438@google.com>
	<1555943483.27247564.1557313967518.JavaMail.zimbra@redhat.com>
Message-ID: <3d643ac5-ea1b-efba-9f42-31b2ed3ab5b0@google.com>
Date: Wed, 8 May 2019 12:05:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1555943483.27247564.1557313967518.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Spam-Status: No, score=-9.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sun, 19 May 2019 16:17:22 +0000
Cc: cohuck@redhat.com, jack@suse.cz, kvm@vger.kernel.org, mst@redhat.com,
	david@fromorbit.com, qemu-devel@nongnu.org,
	virtualization@lists.linux-foundation.org,
	adilger kernel <adilger.kernel@dilger.ca>, smbarber@google.com,
	zwisler@kernel.org, aarcange@redhat.com,
	dave jiang <dave.jiang@intel.com>, linux-nvdimm@lists.01.org,
	vishal l verma <vishal.l.verma@intel.com>, willy@infradead.org,
	hch@infradead.org, linux-acpi@vger.kernel.org, jmoyer@redhat.com,
	linux-ext4@vger.kernel.org, lenb@kernel.org, kilobyte@angband.pl,
	riel@surriel.com, yuval shaia <yuval.shaia@oracle.com>,
	stefanha@redhat.com, imammedo@redhat.com,
	dan j williams <dan.j.williams@intel.com>,
	lcapitulino@redhat.com, nilal@redhat.com, tytso@mit.edu,
	xiaoguangrong eric <xiaoguangrong.eric@gmail.com>,
	darrick wong <darrick.wong@oracle.com>, rjw@rjwysocki.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, pbonzini@redhat.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
From: =?UTF-8?Q?Jakub_Staro=c5=84?= via Virtualization
	<virtualization@lists.linux-foundation.org>
Reply-To: =?UTF-8?Q?Jakub_Staro=c5=84?= <jstaron@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On 5/8/19 4:12 AM, Pankaj Gupta wrote:
> 
>>
>> On 4/25/19 10:00 PM, Pankaj Gupta wrote:
>>
>>> +void host_ack(struct virtqueue *vq)
>>> +{
>>> +	unsigned int len;
>>> +	unsigned long flags;
>>> +	struct virtio_pmem_request *req, *req_buf;
>>> +	struct virtio_pmem *vpmem = vq->vdev->priv;
>>> +
>>> +	spin_lock_irqsave(&vpmem->pmem_lock, flags);
>>> +	while ((req = virtqueue_get_buf(vq, &len)) != NULL) {
>>> +		req->done = true;
>>> +		wake_up(&req->host_acked);
>>> +
>>> +		if (!list_empty(&vpmem->req_list)) {
>>> +			req_buf = list_first_entry(&vpmem->req_list,
>>> +					struct virtio_pmem_request, list);
>>> +			list_del(&vpmem->req_list);
>>
>> Shouldn't it be rather `list_del(vpmem->req_list.next)`? We are trying to
>> unlink
>> first element of the list and `vpmem->req_list` is just the list head.
> 
> This looks correct. We are not deleting head but first entry in 'req_list'
> which is device corresponding list of pending requests.
> 
> Please see below:
> 
> /**
>  * Retrieve the first list entry for the given list pointer.
>  *
>  * Example:
>  * struct foo *first;
>  * first = list_first_entry(&bar->list_of_foos, struct foo, list_of_foos);
>  *
>  * @param ptr The list head
>  * @param type Data type of the list element to retrieve
>  * @param member Member name of the struct list_head field in the list element.
>  * @return A pointer to the first list element.
>  */
> #define list_first_entry(ptr, type, member) \
>     list_entry((ptr)->next, type, member)

Please look at this StackOverflow question:
https://stackoverflow.com/questions/19675419/deleting-first-element-of-a-list-h-list

Author asks about deleting first element of the queue. In our case
(and also in the question's author case), `vpmem->req_list` is not element
of any request struct and not an element of the list. It's just a list head storing 
`next` and `prev` pointers which are then pointing to respectively first and
last element of the list. We want to unlink the first element of the list,
so we need to pass pointer to the first element of the list to
the `list_del` function - that is, the `vpmem->req_list.next`.

Thank you,
Jakub Staron
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
