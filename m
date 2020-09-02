Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AE325AAF8
	for <lists.virtualization@lfdr.de>; Wed,  2 Sep 2020 14:17:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 658BD8679B;
	Wed,  2 Sep 2020 12:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U6t3vzonCx3h; Wed,  2 Sep 2020 12:16:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 30D1386868;
	Wed,  2 Sep 2020 12:16:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 207F1C0051;
	Wed,  2 Sep 2020 12:16:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E739AC0051
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Sep 2020 12:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D09B086815
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Sep 2020 12:16:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M02k-D65kpaP
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Sep 2020 12:16:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A9D9A866E7
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Sep 2020 12:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RNU3BkQu16lOQlYGQKQxt8zBm/7aT5lbKoI0zD9sSfE=; b=NrzrFjUve86ObeH80hRi+UY4Ia
 wcC4oHLPwHYm4kLDoNvqCdyBnBJAT6S2GSuMEysHk6JFY1Tmr+YmyPNYJKNC1wU2ci3VG7Xz02YrD
 It41EeiD7l/VWwhhQF4ZPHW+kQ8y81L+Dkc9zcyN+rO8f5Nje1ft6qDa5953BdrqTRKhPemmV7QC7
 QlwtE6vOgxCosBy1wqdllKQrgpzQk0sClXB73Tp75rUW/y3lMNtEoJv2rysLLcaL1jU92cwjsJkO6
 6VrJQXKkOhxVtgTsb36VILMkDllECEBh/VMRz/ko4ySbYLSwZKz1kpK+If5Vmzu/+Pq7tLdIpkjUZ
 s5RAGxXw==;
Received: from amit by merlin.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kDRh6-0001C3-Th; Wed, 02 Sep 2020 12:16:52 +0000
Date: Wed, 2 Sep 2020 08:16:52 -0400
From: Amit Shah <amit@infradead.org>
To: Michal Suchanek <msuchanek@suse.de>
Subject: Re: [PATCH] char: virtio: Select VIRTIO from VIRTIO_CONSOLE.
Message-ID: <20200902121652.GA4173@merlin.infradead.org>
References: <20200831165850.26163-1-msuchanek@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200831165850.26163-1-msuchanek@suse.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Amit Shah <amit@kernel.org>
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

On Mon, Aug 31, 2020 at 06:58:50PM +0200, Michal Suchanek wrote:
> Make it possible to have virtio console built-in when
> other virtio drivers are modular.
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>

Reviewed-by: Amit Shah <amit@kernel.org>

> ---
>  drivers/char/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
> index 3a144c000a38..9bd9917ca9af 100644
> --- a/drivers/char/Kconfig
> +++ b/drivers/char/Kconfig
> @@ -93,8 +93,9 @@ config PPDEV
>  
>  config VIRTIO_CONSOLE
>  	tristate "Virtio console"
> -	depends on VIRTIO && TTY
> +	depends on TTY
>  	select HVC_DRIVER
> +	select VIRTIO
>  	help
>  	  Virtio console for use with hypervisors.
>  
> -- 
> 2.28.0
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
