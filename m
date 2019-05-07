Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD88166F0
	for <lists.virtualization@lfdr.de>; Tue,  7 May 2019 17:37:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2B534CA8;
	Tue,  7 May 2019 15:37:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8DC3B9EE
	for <virtualization@lists.linux-foundation.org>;
	Tue,  7 May 2019 15:37:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2E5FC7DB
	for <virtualization@lists.linux-foundation.org>;
	Tue,  7 May 2019 15:37:13 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id d10so10236229otp.11
	for <virtualization@lists.linux-foundation.org>;
	Tue, 07 May 2019 08:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6dOaY+uD9DJjErKzQ4lbx3sa2d0JDi7CHezoB5wTbvY=;
	b=1RDaQiep4r+5NZ7RO5zftr0FnsMUZwAyLWkMBkR9iTDOBSIJayhPK4u9DWG7+9yxpt
	9FJnbG3lrhIL0LedEM5ytUIEEGfVVBYdsCV16Q3ZevH87Y7p3IJljktvzFGtbrtOW9jV
	qgMeHUIAfkrXfVgCh+wJIUgLwx8HPs0Hso14g3nE34tG3uE5Kaf93v1albOqeZ8FtzEo
	MRnNU+jjU7Bd7Hg2HKOClTmC45crVs8w8TurxKr/6z1WENdYw/y//CLDQEQmIA9Rf7i+
	OKLRLxxsnQvga0Mn1E5gFobavHOZ9OlvYblRdklzqgaUM3FSIzUzMZWnI38rOf5/Ueyc
	SI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6dOaY+uD9DJjErKzQ4lbx3sa2d0JDi7CHezoB5wTbvY=;
	b=Pm/gPKaU5mN4VoMX4Mj2CyRto24g9mbTgPoLgCWGclfytPlDCSKBgo2gKwOO7Es+sA
	NCdlwJR8xNzktgperLWB2MKNVTPln1QKQoU7SmK0/IKV7XqNBQOJf2BbCRA8qumON5Ik
	SHjwsNxbF+nykX7GO95Jjd3XGzFp6h0QTUg1cfAMrIkoL7REjBv7DfvEtte4HftSOxQy
	hvjJixaaTQ9TLvfv8q1jeZVCbbdbLT0P7AaqEhjCFRyN/OI0s/reeZnMleE34pAhPglr
	sh4yeBeru4Aw/rTSHANRaNIXKePyGWn7AxW8FLCoqvw4/WRCWwGwAQdk/D434ZeYY8gh
	Qv/A==
X-Gm-Message-State: APjAAAUqoxcpokNuxpznJmCJIMrILoH/AL7OMJWVkXMWnz9BDPMhJYBx
	6qp5+3YRR6Q0dOWDIR6LOicIFhq2vbHKzXBzhDar+A==
X-Google-Smtp-Source: APXvYqxbxERKNtTaVpMxD9jAh6w8zsl3plIje9NPoM99XF0whcoJ/rqAndFua0o+8QlJA2fPNaeXZRcDVPm+ejCVDvk=
X-Received: by 2002:a9d:222c:: with SMTP id o41mr22019501ota.353.1557243432435;
	Tue, 07 May 2019 08:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190426050039.17460-1-pagupta@redhat.com>
	<20190426050039.17460-7-pagupta@redhat.com>
In-Reply-To: <20190426050039.17460-7-pagupta@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 7 May 2019 08:37:01 -0700
Message-ID: <CAPcyv4hCP4E4xPkQx25tqhznon6ADwrYJB1yujkrO-A7LUnsmg@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] xfs: disable map_sync for async flush
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
	Dave Jiang <dave.jiang@intel.com>,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	Vishal L Verma <vishal.l.verma@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	Linux ACPI <linux-acpi@vger.kernel.org>, jmoyer <jmoyer@redhat.com>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Len Brown <lenb@kernel.org>, kilobyte@angband.pl,
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

On Thu, Apr 25, 2019 at 10:03 PM Pankaj Gupta <pagupta@redhat.com> wrote:
>
> Dont support 'MAP_SYNC' with non-DAX files and DAX files
> with asynchronous dax_device. Virtio pmem provides
> asynchronous host page cache flush mechanism. We don't
> support 'MAP_SYNC' with virtio pmem and xfs.
>
> Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> ---
>  fs/xfs/xfs_file.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Darrick, does this look ok to take through the nvdimm tree?

>
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index a7ceae90110e..f17652cca5ff 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -1203,11 +1203,14 @@ xfs_file_mmap(
>         struct file     *filp,
>         struct vm_area_struct *vma)
>  {
> +       struct dax_device       *dax_dev;
> +
> +       dax_dev = xfs_find_daxdev_for_inode(file_inode(filp));
>         /*
> -        * We don't support synchronous mappings for non-DAX files. At least
> -        * until someone comes with a sensible use case.
> +        * We don't support synchronous mappings for non-DAX files and
> +        * for DAX files if underneath dax_device is not synchronous.
>          */
> -       if (!IS_DAX(file_inode(filp)) && (vma->vm_flags & VM_SYNC))
> +       if (!daxdev_mapping_supported(vma, dax_dev))
>                 return -EOPNOTSUPP;
>
>         file_accessed(filp);
> --
> 2.20.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
