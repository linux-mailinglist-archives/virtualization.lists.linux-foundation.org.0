Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA8EA7F0A
	for <lists.virtualization@lfdr.de>; Wed,  4 Sep 2019 11:15:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7F9A4121B;
	Wed,  4 Sep 2019 09:15:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5D5AE1207
	for <virtualization@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 09:14:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CD043831
	for <virtualization@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 09:14:44 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB732C01F2E8
	for <virtualization@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 09:14:43 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id a2so11657124wrs.8
	for <virtualization@lists.linux-foundation.org>;
	Wed, 04 Sep 2019 02:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=WulsqcUDqGAlte0XT35jyBuHqWE16gY7+JD//6GJ8LE=;
	b=RhVaP7ZlTq0huPW0817CsN8LjlDIClO3hh2lMy1WCQq8s58V+g1rU7PjEhTY1C824u
	szb/5hUReO12v3cifPhDAdsEHu0A//c0LMWFci9YA4exjWAnjFRg5cjU7xuDZkIN4ad5
	7eeXVwlr8VY+44ffYJeG5sFOas345JaqCYcC0SjIzJs+AtYZyrMRXx3SQAgWARwh0Crd
	IpnZ5Hd4awrvfyJdh9Gu0hE2ISTUZYQCzXxeyQxOQA0GIS+SrDmkDYVtRYGGzy0odmzY
	fHlOo2Lan917BafsFrgssRb47dRH+bQQiVlpNl9KpLYqGXCrIubK8NBbHoc2LOJxm1kl
	W7+g==
X-Gm-Message-State: APjAAAUAeZ5hEctIv4Ib6lgvTJoC1jHnNofwcql47oxXbfgmv0hi0bOE
	TLqlTGM+MSIQKbi2vTPZ0D3P7UZyHQbTCi1zyQTJtFhJESt+ihC08AxVyWp5/q1CNaGWOA2zCA+
	9syr375M6nFlnEkFo+GO5/0ofK2frFdFijmcd/tdNjA==
X-Received: by 2002:a1c:9e03:: with SMTP id h3mr3545587wme.112.1567588482696; 
	Wed, 04 Sep 2019 02:14:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyWE7W0esSMrtACJMfgH6u7NS92/HwtNgSGZHmvycxF9VRjYlNRFA/kgpbIhqo36d95tm0xTQ==
X-Received: by 2002:a1c:9e03:: with SMTP id h3mr3545568wme.112.1567588482495; 
	Wed, 04 Sep 2019 02:14:42 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id b1sm2455532wmj.4.2019.09.04.02.14.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 02:14:41 -0700 (PDT)
Date: Wed, 4 Sep 2019 05:14:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matt Lupfer <mlupfer@ddn.com>
Subject: Re: [PATCH] scsi: virtio_scsi: unplug LUNs when events missed
Message-ID: <20190904051230-mutt-send-email-mst@kernel.org>
References: <20190903170408.32286-1-mlupfer@ddn.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903170408.32286-1-mlupfer@ddn.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"James E . J . Bottomley" <jejb@linux.ibm.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Tue, Sep 03, 2019 at 05:04:20PM +0000, Matt Lupfer wrote:
> The event handler calls scsi_scan_host() when events are missed, which
> will hotplug new LUNs.  However, this function won't remove any
> unplugged LUNs.  The result is that hotunplug doesn't work properly when
> the number of unplugged LUNs exceeds the event queue size (currently 8).
> 
> Scan existing LUNs when events are missed to check if they are still
> present.  If not, remove them.
> 
> Signed-off-by: Matt Lupfer <mlupfer@ddn.com>
> ---
>  drivers/scsi/virtio_scsi.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
> index 297e1076e571..18df77bf371b 100644
> --- a/drivers/scsi/virtio_scsi.c
> +++ b/drivers/scsi/virtio_scsi.c
> @@ -324,6 +324,36 @@ static void virtscsi_handle_param_change(struct virtio_scsi *vscsi,
>  	scsi_device_put(sdev);
>  }
>  
> +static void virtscsi_rescan_hotunplug(struct virtio_scsi *vscsi)
> +{
> +	struct scsi_device *sdev;
> +	struct Scsi_Host *shost = virtio_scsi_host(vscsi->vdev);
> +	unsigned char scsi_cmd[MAX_COMMAND_SIZE];
> +	int result, inquiry_len, inq_result_len = 256;
> +	char *inq_result = kmalloc(inq_result_len, GFP_KERNEL);
> +
> +	shost_for_each_device(sdev, shost) {
> +		inquiry_len = sdev->inquiry_len ? sdev->inquiry_len : 36;
> +
> +		memset(scsi_cmd, 0, sizeof(scsi_cmd));
> +		scsi_cmd[0] = INQUIRY;
> +		scsi_cmd[4] = (unsigned char) inquiry_len;
> +
> +		memset(inq_result, 0, inq_result_len);
> +
> +		result = scsi_execute_req(sdev, scsi_cmd, DMA_FROM_DEVICE,
> +					  inq_result, inquiry_len, NULL,
> +					  2, 3, NULL);


Where do the weird 2 and 3 values come from?

Most callers seem to use SD_TIMEOUT, SD_MAX_RETRIES...

> +
> +		if (result == 0 && inq_result[0] >> 5) {
> +			/* PQ indicates the LUN is not attached */
> +			scsi_remove_device(sdev);
> +		}
> +	}
> +
> +	kfree(inq_result);
> +}
> +
>  static void virtscsi_handle_event(struct work_struct *work)
>  {
>  	struct virtio_scsi_event_node *event_node =
> @@ -335,6 +365,7 @@ static void virtscsi_handle_event(struct work_struct *work)
>  	    cpu_to_virtio32(vscsi->vdev, VIRTIO_SCSI_T_EVENTS_MISSED)) {
>  		event->event &= ~cpu_to_virtio32(vscsi->vdev,
>  						   VIRTIO_SCSI_T_EVENTS_MISSED);
> +		virtscsi_rescan_hotunplug(vscsi);
>  		scsi_scan_host(virtio_scsi_host(vscsi->vdev));
>  	}
>  
> -- 
> 2.23.0
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
