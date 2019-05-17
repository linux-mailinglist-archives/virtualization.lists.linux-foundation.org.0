Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5942274A
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:24:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D113FCF6;
	Sun, 19 May 2019 16:17:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 31D575A8
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 00:12:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 162BC5E4
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 00:12:40 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id c13so2364169pgt.1
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 17:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=grI6nIUF/mMOBdv6LrPvHsdNVES0yai/LfFYIZ4bkWY=;
	b=trB5X+v2CFHJR5/h5Ogo8pnGEbixSq/5SbMCfW0BvmcDG2zeRdzxHL4lknPMI8JsaG
	91o9aNowjUtiTckfyBLWY/pZJBmRERl33EcI9dq0zR0lXd+XHl45wImJtwD6qTmBiD3C
	YvIdILOfNr02D208IUOgX7xjB1B80gLQERVK/akSkqvFqS79gmXpU/duephS4OxkvMCj
	iFkaZbcWb+04sJYfOvlYsPNWM7LK/oP8HkDOryS8f1XdKVoMLZUlQ8YVZMbBQiMDnraB
	fYXacmGWn0btEdYeftIv0rPSsHpeCBXpkkAwnfL+k2zqdhfQJ6WS6TGQ7DeGxI98ZyT1
	d5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=grI6nIUF/mMOBdv6LrPvHsdNVES0yai/LfFYIZ4bkWY=;
	b=sbUbuuGANcm5nXbhw4StR+AjheXfT4Xjt1LJNTaucqoM9qfvDkuzzEoDZQBqalWAbR
	v0I6OvBVoVsYQQpqYgii5WbnM3EZ8d08pfFLJVCrareI+i/JLqpTQNaKdvGDtyq2qpUU
	VZZsMp6XSaWaT7IGIkx7crXcK6JnY8nDGE/Y0Lz0mf68nHlHRmQJFTHT/sRWSawYjYcj
	58GgVb2wDUhBg/rasfR5eCaWtOptRJmn0QrVN6HKLqw8tfAaBdctm45EN5EkzWLcLZwz
	cBNPdSuAcbvrz+BTWRmm5tr32/nWwrmB+sebaFV05fVDodx9+h+p5GKg2TLLDRMTXqYT
	B58Q==
X-Gm-Message-State: APjAAAUO2wh84aeC11rFbVg97rrTjUgpvbXDzl/lQhzaHnFCGH0AVlg+
	CGZxHNnj8k/Twqomc5MzvvlC8g==
X-Google-Smtp-Source: APXvYqyv1iVBQbL6jyOdYGu6UtPQiwVBUuqofcSXUoK/ck1DMyLzSDgzGJaT2Ro5WErOmsiHR9V/gQ==
X-Received: by 2002:a63:d816:: with SMTP id b22mr52619479pgh.16.1558051959951; 
	Thu, 16 May 2019 17:12:39 -0700 (PDT)
Received: from jstaron2.mtv.corp.google.com
	([2620:15c:202:201:b94f:2527:c39f:ca2d])
	by smtp.gmail.com with ESMTPSA id a6sm7245768pgd.67.2019.05.16.17.12.37
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 17:12:39 -0700 (PDT)
Subject: Re: [PATCH v9 2/7] virtio-pmem: Add virtio pmem driver
To: Pankaj Gupta <pagupta@redhat.com>, linux-nvdimm@lists.01.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-acpi@vger.kernel.org, qemu-devel@nongnu.org,
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
References: <20190514145422.16923-1-pagupta@redhat.com>
	<20190514145422.16923-3-pagupta@redhat.com>
Message-ID: <c06514fd-8675-ba74-4b7b-ff0eb4a91605@google.com>
Date: Thu, 16 May 2019 17:12:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514145422.16923-3-pagupta@redhat.com>
Content-Language: en-US
X-Spam-Status: No, score=-9.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sun, 19 May 2019 16:17:22 +0000
Cc: jack@suse.cz, mst@redhat.com, david@fromorbit.com, lcapitulino@redhat.com,
	adilger.kernel@dilger.ca, smbarber@google.com,
	zwisler@kernel.org, aarcange@redhat.com, dave.jiang@intel.com,
	darrick.wong@oracle.com, vishal.l.verma@intel.com,
	willy@infradead.org, hch@infradead.org, jmoyer@redhat.com,
	nilal@redhat.com, lenb@kernel.org, kilobyte@angband.pl,
	riel@surriel.com, yuval.shaia@oracle.com, stefanha@redhat.com,
	pbonzini@redhat.com, dan.j.williams@intel.com, tytso@mit.edu,
	xiaoguangrong.eric@gmail.com, cohuck@redhat.com,
	rjw@rjwysocki.net, imammedo@redhat.com
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

On 5/14/19 7:54 AM, Pankaj Gupta wrote:
> +		if (!list_empty(&vpmem->req_list)) {
> +			req_buf = list_first_entry(&vpmem->req_list,
> +					struct virtio_pmem_request, list);
> +			req_buf->wq_buf_avail = true;
> +			wake_up(&req_buf->wq_buf);
> +			list_del(&req_buf->list);
Yes, this change is the right one, thank you!

> +	 /*
> +	  * If virtqueue_add_sgs returns -ENOSPC then req_vq virtual
> +	  * queue does not have free descriptor. We add the request
> +	  * to req_list and wait for host_ack to wake us up when free
> +	  * slots are available.
> +	  */
> +	while ((err = virtqueue_add_sgs(vpmem->req_vq, sgs, 1, 1, req,
> +					GFP_ATOMIC)) == -ENOSPC) {
> +
> +		dev_err(&vdev->dev, "failed to send command to virtio pmem" \
> +			"device, no free slots in the virtqueue\n");
> +		req->wq_buf_avail = false;
> +		list_add_tail(&req->list, &vpmem->req_list);
> +		spin_unlock_irqrestore(&vpmem->pmem_lock, flags);
> +
> +		/* A host response results in "host_ack" getting called */
> +		wait_event(req->wq_buf, req->wq_buf_avail);
> +		spin_lock_irqsave(&vpmem->pmem_lock, flags);
> +	}
> +	err1 = virtqueue_kick(vpmem->req_vq);
> +	spin_unlock_irqrestore(&vpmem->pmem_lock, flags);
> +
> +	/*
> +	 * virtqueue_add_sgs failed with error different than -ENOSPC, we can't
> +	 * do anything about that.
> +	 */
> +	if (err || !err1) {
> +		dev_info(&vdev->dev, "failed to send command to virtio pmem device\n");
> +		err = -EIO;
> +	} else {
> +		/* A host repsonse results in "host_ack" getting called */
> +		wait_event(req->host_acked, req->done);
> +		err = req->ret;
> +I confirm that the failures I was facing with the `-ENOSPC` error path are not present in v9.

Best,
Jakub Staron
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
