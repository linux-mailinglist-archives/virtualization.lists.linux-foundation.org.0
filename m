Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB43310DB7
	for <lists.virtualization@lfdr.de>; Fri,  5 Feb 2021 17:17:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1B25686B45;
	Fri,  5 Feb 2021 16:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CZ5zEbLnGhY1; Fri,  5 Feb 2021 16:17:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7F7AD86B20;
	Fri,  5 Feb 2021 16:17:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5DB88C013A;
	Fri,  5 Feb 2021 16:17:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65BBFC013A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Feb 2021 16:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4D7F220404
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Feb 2021 16:17:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WIBj1jUCFYxL
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Feb 2021 16:17:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 5179020399
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Feb 2021 16:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612541845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=khNEiGi3gSDvPl4eGhmwPqK2s3UCa52HPIkP8Eu2Bsc=;
 b=FM8oyv3xKVbT0NKo+pXgGJ5G7Bhe3oF84O026eI8QBYoQEjGPnrfBRM91XdkHg3UECXZY/
 WM6eqLqpCnRozhmhWzfzrHxxuC/J07OmPuUYlFJJiBEbRYbDnJL/Jgex0AjMED048aZ/8f
 vZjLOn6tOLmSlRpKwRf8LROFTkV3qpk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-LtnAJjPVN5S7uxY5agA6-A-1; Fri, 05 Feb 2021 11:17:24 -0500
X-MC-Unique: LtnAJjPVN5S7uxY5agA6-A-1
Received: by mail-ej1-f71.google.com with SMTP id d15so7025466ejc.21
 for <virtualization@lists.linux-foundation.org>;
 Fri, 05 Feb 2021 08:17:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=khNEiGi3gSDvPl4eGhmwPqK2s3UCa52HPIkP8Eu2Bsc=;
 b=td4KcveHN2wq6M4xvw9t64Z3nJ3OVPrggHjsNuRl5O4d72yw69c93Zq3s17b2mfWpn
 ZGM5e9MxderLWbDxDiaw8KbTrmkLiUzszW8VPn1YJZui5NnwaOlj6vtQqyjoCpPcLG0d
 pnOyau+TeW5z31EfcWZPL3lwaXSMdHRcW7kImhW864BQzzwdhF2wqK/qy3VwnY9unGUL
 Ba9cxVNQElpqeYnwrOjfgc/EbmFyW3hH/ymnu5iEFt7oNoFSY5KfEcPj9j30+v0y8LZK
 vnMDzVFLonnnECbL3r1jTa3z0FT4wEkdpcq4g55TnjzjmUqiIeYLmkd+kS80ScmOoO5D
 jDMg==
X-Gm-Message-State: AOAM530kXPkwHke/gKxHqCfnSarfiyjRn/cCBSOGET6qJP6gT6bWfbSM
 Gz84Vqa0ty6+1wYGuXeOza9KAtreIoe9u3a66F9YZlU3QEePMAXCCycNQ6HWqEyq80GdPHuXstR
 ttEMj+aPHDNcYnzV8HhKQ0S6lMpTcr6ynKMKotFHWRQ==
X-Received: by 2002:a17:906:169b:: with SMTP id
 s27mr343275ejd.396.1612541842914; 
 Fri, 05 Feb 2021 08:17:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxASMO+xswfNgpQwV8wyefPe1EMyJevJ53IOHaWEyDD08C7S3RPlbtBmcuhKVYuF8c/fBWAdQ==
X-Received: by 2002:a17:906:169b:: with SMTP id
 s27mr343257ejd.396.1612541842771; 
 Fri, 05 Feb 2021 08:17:22 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id 94sm2442486edq.91.2021.02.05.08.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 08:17:22 -0800 (PST)
Date: Fri, 5 Feb 2021 11:17:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 05/11] vhost scsi: use lio wq cmd submission helper
Message-ID: <20210205111638-mutt-send-email-mst@kernel.org>
References: <20210204113513.93204-1-michael.christie@oracle.com>
 <20210204113513.93204-6-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20210204113513.93204-6-michael.christie@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 virtualization@lists.linux-foundation.org, target-devel@vger.kernel.org,
 stefanha@redhat.com
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

On Thu, Feb 04, 2021 at 05:35:07AM -0600, Mike Christie wrote:
> @@ -1132,14 +1127,8 @@ vhost_scsi_handle_vq(struct vhost_scsi *vs, struct vhost_virtqueue *vq)
>  		 * vhost_scsi_queue_data_in() and vhost_scsi_queue_status()
>  		 */
>  		cmd->tvc_vq_desc = vc.head;
> -		/*
> -		 * Dispatch cmd descriptor for cmwq execution in process
> -		 * context provided by vhost_scsi_workqueue.  This also ensures
> -		 * cmd is executed on the same kworker CPU as this vhost
> -		 * thread to gain positive L2 cache locality effects.
> -		 */
> -		INIT_WORK(&cmd->work, vhost_scsi_submission_work);
> -		queue_work(vhost_scsi_workqueue, &cmd->work);
> +		target_queue_cmd_submit(tpg->tpg_nexus->tvn_se_sess,
> +					&cmd->tvc_se_cmd);
>  		ret = 0;
>  err:
>  		/*

What about this aspect? Will things still stay on the same CPU?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
