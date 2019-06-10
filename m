Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B008C3BCD5
	for <lists.virtualization@lfdr.de>; Mon, 10 Jun 2019 21:29:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3AE15DD4;
	Mon, 10 Jun 2019 19:29:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8419DDC5
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 19:28:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 22A06711
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 19:28:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D9FFB120D7;
	Mon, 10 Jun 2019 19:28:23 +0000 (UTC)
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A734160C47;
	Mon, 10 Jun 2019 19:28:04 +0000 (UTC)
Date: Mon, 10 Jun 2019 15:28:03 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Pankaj Gupta <pagupta@redhat.com>
Subject: Re: [PATCH v11 4/7] dm: enable synchronous dax
Message-ID: <20190610192803.GA29002@redhat.com>
References: <20190610090730.8589-1-pagupta@redhat.com>
	<20190610090730.8589-5-pagupta@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190610090730.8589-5-pagupta@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 10 Jun 2019 19:28:48 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: cohuck@redhat.com, jack@suse.cz, kvm@vger.kernel.org, mst@redhat.com,
	david@fromorbit.com, qemu-devel@nongnu.org,
	virtualization@lists.linux-foundation.org, dm-devel@redhat.com,
	adilger.kernel@dilger.ca, zwisler@kernel.org,
	aarcange@redhat.com, dave.jiang@intel.com, jstaron@google.com,
	linux-nvdimm@lists.01.org, vishal.l.verma@intel.com,
	willy@infradead.org, hch@infradead.org,
	linux-acpi@vger.kernel.org, jmoyer@redhat.com,
	linux-ext4@vger.kernel.org, lenb@kernel.org, kilobyte@angband.pl,
	rdunlap@infradead.org, riel@surriel.com, yuval.shaia@oracle.com,
	stefanha@redhat.com, pbonzini@redhat.com,
	dan.j.williams@intel.com, lcapitulino@redhat.com,
	nilal@redhat.com, tytso@mit.edu, xiaoguangrong.eric@gmail.com,
	darrick.wong@oracle.com, rjw@rjwysocki.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, imammedo@redhat.com
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

On Mon, Jun 10 2019 at  5:07am -0400,
Pankaj Gupta <pagupta@redhat.com> wrote:

>  This patch sets dax device 'DAXDEV_SYNC' flag if all the target
>  devices of device mapper support synchrononous DAX. If device
>  mapper consists of both synchronous and asynchronous dax devices,
>  we don't set 'DAXDEV_SYNC' flag.
> 
> Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> ---
>  drivers/md/dm-table.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> index 350cf0451456..c5160d846fe6 100644
> --- a/drivers/md/dm-table.c
> +++ b/drivers/md/dm-table.c
> @@ -890,10 +890,17 @@ static int device_supports_dax(struct dm_target *ti, struct dm_dev *dev,
>  			start, len);
>  }
>  
> +static int device_synchronous(struct dm_target *ti, struct dm_dev *dev,
> +				       sector_t start, sector_t len, void *data)
> +{
> +	return dax_synchronous(dev->dax_dev);
> +}
> +
>  bool dm_table_supports_dax(struct dm_table *t, int blocksize)
>  {
>  	struct dm_target *ti;
>  	unsigned i;
> +	bool dax_sync = true;
>  
>  	/* Ensure that all targets support DAX. */
>  	for (i = 0; i < dm_table_get_num_targets(t); i++) {
> @@ -906,7 +913,14 @@ bool dm_table_supports_dax(struct dm_table *t, int blocksize)
>  		    !ti->type->iterate_devices(ti, device_supports_dax,
>  			    &blocksize))
>  			return false;
> +
> +		/* Check devices support synchronous DAX */
> +		if (dax_sync &&
> +		    !ti->type->iterate_devices(ti, device_synchronous, NULL))
> +			dax_sync = false;
>  	}
> +	if (dax_sync)
> +		set_dax_synchronous(t->md->dax_dev);
>  
>  	return true;
>  }
> -- 
> 2.20.1
> 

dm_table_supports_dax() is called multiple times (from
dm_table_set_restrictions and dm_table_determine_type).  It is strange
to have a getter have a side-effect of being a setter too.  Overloading
like this could get you in trouble in the future.

Are you certain this is what you want?

Or would it be better to refactor dm_table_supports_dax() to take an
iterate_devices_fn arg and have callers pass the appropriate function?
Then have dm_table_set_restrictions() caller do:

     if (dm_table_supports_dax(t, device_synchronous, NULL))
     	  set_dax_synchronous(t->md->dax_dev);

(NULL arg implies dm_table_supports_dax() refactoring would take a int
*data pointer rather than int type).

Mike
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
