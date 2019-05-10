Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 789701A3D0
	for <lists.virtualization@lfdr.de>; Fri, 10 May 2019 22:14:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A1437EE1;
	Fri, 10 May 2019 20:14:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 31144A70
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 20:14:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B8A52875
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 20:14:18 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id 143so5444937oii.4
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 13:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=glYXor0GQ9DfKpghbnKPKxe+zUzoJeb7GoYJ26Vk6ps=;
	b=yf8U/VwdNl5tfgFPEKe5qh3THkRWZb9un60SOgkfJ/5LhvAwk90OALPbQmqH8NGPZg
	Cr23IQd+McBJGud2E9ep2+5K3niud5mH6fhTcdytKwGg0ifP80vvI1KiLl0J9xx4xwjq
	TEllzhY/P52SG7Zgqu0zO0TcVHYyKzcfJiA7uwMKIIPnUXohIrhjvrd+s0fzp7fbWFpQ
	y62fi/8hXK8LlUhb+lV4PauDhwTsmzrWQoEzPH1EBWKu2DNHNpcM/c0ugQiTxq1CS/Pn
	ELZfOgWViQuoOxYDdqZ2L8n4KiCZbfdn+ONJLYDNxFTBB6M7dS0ALwRsezeWWJXIVakV
	lNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=glYXor0GQ9DfKpghbnKPKxe+zUzoJeb7GoYJ26Vk6ps=;
	b=hQrlS7Darbw7z+qGY3CBCSr4ttUycUPGo+PSJ5sJ5FsBG6vKMHIg0BLzj0H3cSSx3E
	5JLz7hDKsh+yZm5m2G6jyNj6bVCMcGgq8uf0l9vLRKbS2pOB7PdTBOf+jGXeTvGi55be
	mOln7VNDRE7ghVTf+MOf7GEqzOvmtnw3QWX9k20xkmNVwLFHwD+5Xq2fBE65grcpJRY2
	15YyvNJRZo0Zw0PlNw5EmGzO/55FWxgN6XVqgiCzKI43AxpfkLv5EQc3G3VUCPWLr7+v
	poN4L0rAepiMj4KtkSCXJLFKFA4CN9OqJR4vHIaZUaZFU30JMeAODGy9JJ56AJJ1aNQS
	Muxg==
X-Gm-Message-State: APjAAAU8ctPcxm0vo1BjMNOhFv9bWLSKbUF2GauYskQeAVy73qj8m7/O
	7kW3tyAfm4eJHkpe2TduuPOFdC+cCVQ3DPjqDbFW+Q==
X-Google-Smtp-Source: APXvYqx7Iy3DOMIV9DNLu2fGaxr7KgtVySuDwyKCLAPX5/jruFRFKJ7CbI+68cxoMCTMjkHKJ+jW3/SnCYNqZpzsnJI=
X-Received: by 2002:aca:4208:: with SMTP id p8mr6821131oia.105.1557519257995; 
	Fri, 10 May 2019 13:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190510155202.14737-1-pagupta@redhat.com>
	<20190510155202.14737-4-pagupta@redhat.com>
In-Reply-To: <20190510155202.14737-4-pagupta@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 10 May 2019 13:14:07 -0700
Message-ID: <CAPcyv4hbVNRFSyS2CTbmO88uhnbeH4eiukAng2cxgbDzLfizwg@mail.gmail.com>
Subject: Re: [PATCH v8 3/6] libnvdimm: add dax_dev sync flag
To: Pankaj Gupta <pagupta@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: cohuck@redhat.com, Jan Kara <jack@suse.cz>, KVM list <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, david <david@fromorbit.com>,
	Qemu Developers <qemu-devel@nongnu.org>,
	virtualization@lists.linux-foundation.org,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Ross Zwisler <zwisler@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
	Dave Jiang <dave.jiang@intel.com>, jstaron@google.com,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	Vishal L Verma <vishal.l.verma@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	Linux ACPI <linux-acpi@vger.kernel.org>, jmoyer <jmoyer@redhat.com>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Len Brown <lenb@kernel.org>, Adam Borowski <kilobyte@angband.pl>,
	Rik van Riel <riel@surriel.com>, yuval shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, lcapitulino@redhat.com,
	Nitesh Narayan Lal <nilal@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Igor Mammedov <imammedo@redhat.com>
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

On Fri, May 10, 2019 at 8:53 AM Pankaj Gupta <pagupta@redhat.com> wrote:
>
> This patch adds 'DAXDEV_SYNC' flag which is set
> for nd_region doing synchronous flush. This later
> is used to disable MAP_SYNC functionality for
> ext4 & xfs filesystem for devices don't support
> synchronous flush.
>
> Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> ---
>  drivers/dax/bus.c            |  2 +-
>  drivers/dax/super.c          | 13 ++++++++++++-
>  drivers/md/dm.c              |  3 ++-
>  drivers/nvdimm/pmem.c        |  5 ++++-
>  drivers/nvdimm/region_devs.c |  7 +++++++
>  include/linux/dax.h          |  8 ++++++--
>  include/linux/libnvdimm.h    |  1 +
>  7 files changed, 33 insertions(+), 6 deletions(-)
[..]
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 043f0761e4a0..ee007b75d9fd 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1969,7 +1969,8 @@ static struct mapped_device *alloc_dev(int minor)
>         sprintf(md->disk->disk_name, "dm-%d", minor);
>
>         if (IS_ENABLED(CONFIG_DAX_DRIVER)) {
> -               dax_dev = alloc_dax(md, md->disk->disk_name, &dm_dax_ops);
> +               dax_dev = alloc_dax(md, md->disk->disk_name, &dm_dax_ops,
> +                                                        DAXDEV_F_SYNC);

Apologies for not realizing this until now, but this is broken.
Imaging a device-mapper configuration composed of both 'async'
virtio-pmem and 'sync' pmem. The 'sync' flag needs to be unified
across all members. I would change this argument to '0' and then
arrange for it to be set at dm_table_supports_dax() time after
validating that all components support synchronous dax.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
