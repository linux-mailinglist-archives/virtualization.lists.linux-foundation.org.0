Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3E5316129
	for <lists.virtualization@lfdr.de>; Wed, 10 Feb 2021 09:44:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4840484363;
	Wed, 10 Feb 2021 08:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mBeJZpxLy9cz; Wed, 10 Feb 2021 08:44:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 845B68464A;
	Wed, 10 Feb 2021 08:44:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C2E1C013A;
	Wed, 10 Feb 2021 08:44:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92381C013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 08:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 802E483C00
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 08:44:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AFKaSKR8qFje
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 08:44:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E55D08347D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 08:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=U1BKN3rsCzUiXJC1oe+xxe/ch8raroLfRcCRmI+lPmc=; b=XvqHlN5NIpj3xl6J+TqXD3YNxu
 XO6fUcydTCSufFLJl9tYudCYSn3AZIbJfzKZOSnjalt2CaNozqO/WDiwy3OpJTdLallfXBkn9aj5n
 nae7MvB4m7WO0G0/1uuxmXM6fQu7qJyHlJ3NmK518kiY6WZJpowOsFilcFvohSIO5al5DG/76QQiL
 i8E9iU1y0eJJQ+F+CJHvciw65uhsgjpb0lxtT56Wnn3An6lUBq05EYdAo3rbL82s3+owqvSChGBpT
 o2aQ2oJHkmaYn9wWxY9+omT3ZBwiErI23dfOkkyPvk9ZWdDlL63aad3GXVbuXgn40Ca4KqcJOkCq6
 zkO1DBRQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l9l6d-008bBr-LW; Wed, 10 Feb 2021 08:44:16 +0000
Date: Wed, 10 Feb 2021 08:44:15 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 12/13] target, vhost-scsi: don't switch cpus on completion
Message-ID: <20210210084415.GF2045726@infradead.org>
References: <20210209123845.4856-1-michael.christie@oracle.com>
 <20210209123845.4856-13-michael.christie@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209123845.4856-13-michael.christie@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: loberman@redhat.com, Chaitanya.Kulkarni@wdc.com, martin.petersen@oracle.com,
 mst@redhat.com, virtualization@lists.linux-foundation.org,
 target-devel@vger.kernel.org, stefanha@redhat.com, linux-scsi@vger.kernel.org
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

>  	struct se_device *se_dev = se_cmd->se_dev;
> -	int cpu = se_cmd->cpuid;
> +	int cpu;
> +
> +	if (se_cmd->se_cmd_flags & SCF_IGNORE_CPUID_COMPL)
> +		cpu = smp_processor_id();
> +	else
> +		cpu = se_cmd->cpuid;
>  
>  	target_queue_cmd_work(&se_dev->queues[cpu].cq, se_cmd, cpu,
>  			      target_completion_wq);

Can't we just use se_cmd->cpuid == WORK_CPU_UNBOUND as the no affinity
indicator, which would remove all branches here.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
