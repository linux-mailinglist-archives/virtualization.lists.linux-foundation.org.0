Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EE9EBCBF
	for <lists.virtualization@lfdr.de>; Fri,  1 Nov 2019 05:07:17 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AA30712C3;
	Fri,  1 Nov 2019 04:07:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 620AB12B5
	for <virtualization@lists.linux-foundation.org>;
	Fri,  1 Nov 2019 04:07:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 6D03A466
	for <virtualization@lists.linux-foundation.org>;
	Fri,  1 Nov 2019 04:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572581226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding;
	bh=t2daL2lc+mNiG+yNduCCQfg4NqVO8/KVSabnd9S96eQ=;
	b=SX64jHrTzbF8EuS2pJ728cn3ssBBKUFAF7nLtuopPXPeMt5kTpKEJxJ+bb3eIFmGVHdKt8
	zp+GHlPkg1a3mglPweg+AJBYSkRhz0rYxwdmD5mz5h2HlOISrNlQJp7V+7OJI/5NfQgu57
	MvL/5QwXgAtMcW/YNCH9SLjVsUaGZ9o=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
	[209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-332-3-InIxHTOvWh7zKYBWCvxA-1; Fri, 01 Nov 2019 00:07:01 -0400
Received: by mail-qt1-f200.google.com with SMTP id v23so8629710qth.20
	for <virtualization@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 21:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition;
	bh=nLOJHIiZAsXpj22dreqdeOji5yeBZe3vA+QI7NJTGo0=;
	b=SVatGh+qfWgyJ80ti77NIOC0SWa0gbiPg+2IvGH2WcEHLXTMhIM0H8cQfTUDyFczJF
	m1Qmf431eX7XdYX5xbmJ+C2Qjej6NLjo8xTjuGZHJobJ0DTaLfaEwbQwLGj5HGTZG1on
	Lci2bBM4laHOQLi3REIP/npLpzixJ61gOfqvHwyYorbhDXURIesh5oSRBsW/cwh4bLuh
	qJzuSUJcWnWGUMEtpVzKvY0eQowvLvnjpeflEngCeWnoon1pff9gKJvH9ikm2iwDHfU3
	AzTAEcO7CeiTG+XZ+VAKYc6sQ8bNkOrhYFbOeP/BDH2x61ovSEUsRUaySJEh4bis2ayf
	Exyw==
X-Gm-Message-State: APjAAAUczdTC0wNenhXJPdh9HGcA4k7uTQ8oLV/31ftVsxk9ewGuUDro
	hnA1xwlvA+TkxX2ZH9Ws0QjaGaRq20yXDEDIbolA+pWEIbEyYt8wg+zuhSjpOirgF8qQlztdLRU
	hoq5mj15w0FMET9FfkTP1hSw6839jm+z9J1IpQmCfIA==
X-Received: by 2002:a37:4350:: with SMTP id q77mr3913284qka.266.1572581221294; 
	Thu, 31 Oct 2019 21:07:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw1BeMvLF0sK2BlgbFLBvSd4pkntwJxqQyejDLAl6jlWjl5fLfUZ/mCvGVhGUDp+E4au0gs9Q==
X-Received: by 2002:a37:4350:: with SMTP id q77mr3913266qka.266.1572581220997; 
	Thu, 31 Oct 2019 21:07:00 -0700 (PDT)
Received: from redhat.com (94.222.26.109.rev.sfr.net. [109.26.222.94])
	by smtp.gmail.com with ESMTPSA id
	k40sm3600997qta.76.2019.10.31.21.06.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 21:06:59 -0700 (PDT)
Date: Fri, 1 Nov 2019 00:06:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org,
	virtualization@lists.linux-foundation.org
Subject: Re: presentation at kvm forum and pagefaults
Message-ID: <20191031234601-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-MC-Unique: 3-InIxHTOvWh7zKYBWCvxA-1
X-Mimecast-Spam-Score: 1
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

Regarding the presentation I gave at the kvm forum
on pagefaults.

Two points:


1. pagefaults are important not just for migration.
They are important for performance features such as
autonuma and huge pages, since this relies on moving
pages around.
Migration can maybe be solved by switch to software but
this is not a good solution for numa and thp  since
at a given time some page is likely being moved.




2.  For devices such as networking RX order in which buffers are
used *does not matter*.
Thus if a device gets a fault in response to attempt to store a buffer
into memory, it can just re-try, using the next buffer in queue instead.

This works because normally buffers can be used out of order by device.

The faulted buffer will be reused by another buffer when driver notifies
device page has been faulted in.

Note buffers are processed by buffer in the order in which they have
been used, *not* the order in which they have been put in the queue.  So
this will *not* cause any packet reordering for the driver.

Packets will only get dropped if all buffers are swapped
out, which should be rare with a large RX queue.


As I said at the forum, a side buffer for X packets
to be stored temporarily is also additionally possible. But with the above
it is no longer strictly required.


This conflicts with the IN_ORDER feature flag, I guess we will have to
re-think this flag then. If we do feel we need to salvage IN_ORDER as is,
maybe device can use the buffer with length 0 and driver will re-post it
later, but I am not I am not sure about this since involving the VF
driver seems inelegant.


-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
