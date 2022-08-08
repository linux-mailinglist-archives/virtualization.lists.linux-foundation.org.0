Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA7558CDFA
	for <lists.virtualization@lfdr.de>; Mon,  8 Aug 2022 20:49:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1009400FE;
	Mon,  8 Aug 2022 18:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1009400FE
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa1 header.b=TPNGyBac;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed1 header.b=MYuJxJSx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JhsL8ixD3bmx; Mon,  8 Aug 2022 18:49:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A203F4012B;
	Mon,  8 Aug 2022 18:49:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A203F4012B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D18DBC007B;
	Mon,  8 Aug 2022 18:49:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43542C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 18:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 024DC4012B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 18:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 024DC4012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D1oYQIfoyoL7
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 18:49:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 227F1400FE
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 227F1400FE
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 18:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=nKOYwTZZ65PdC0VRg8e7/XcVp9WooaOm9vxXz1gbBFY=;
 b=TPNGyBac1foa0UsoTE2jesNt3TKqB0NjUSjiOPFkwRSVcuPUXhcTLw2j7GK93EB+AaMsubEdfYmQF
 Q7jbVl/39o+P7VSFclUc6T+NzGmSzepkeGXc5Sp179ml9eQYpSbjnVlot8wjwrYEdDfM4phv4eg4o+
 ebami4unKo1SDCZIUg7RmahVjzrQSYYXWEKgI10Ileh8UmaECUfSvT8dTw+1nBE0hF74gSj3YzN3+m
 9gTXTGCu5dYP4wByI4GmLhmbF6yOJ3B11HBf5sw6EwKiGstRA6GXkOtkm9i/tXfm/+elJGGfuhcE5U
 O7raIrlydTSJvFLiDFiIrVA8Kg9WI4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=nKOYwTZZ65PdC0VRg8e7/XcVp9WooaOm9vxXz1gbBFY=;
 b=MYuJxJSxPDzJ3Xr6Z3WUQ1u/AVjKDX+tGJZADa81fil8E7oUKAEZnSnxRqRBhTjTDmMcIsJwi6SaD
 RtY5qSlBA==
X-HalOne-Cookie: 3967e1364f7fe32ed1414702d454dd7963b225bd
X-HalOne-ID: c7bed67f-174a-11ed-be82-d0431ea8bb03
Received: from mailproxy3.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id c7bed67f-174a-11ed-be82-d0431ea8bb03;
 Mon, 08 Aug 2022 18:49:06 +0000 (UTC)
Date: Mon, 8 Aug 2022 20:49:05 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 14/14] drm/format-helper: Rename parameter vmap to src
Message-ID: <YvFaoYvcfC016JRF@ravnborg.org>
References: <20220808125406.20752-1-tzimmermann@suse.de>
 <20220808125406.20752-15-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220808125406.20752-15-tzimmermann@suse.de>
Cc: linux-hyperv@vger.kernel.org, david@lechnology.com, airlied@linux.ie,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, mripard@kernel.org,
 virtualization@lists.linux-foundation.org, drawat.floss@gmail.com,
 noralf@tronnes.org, daniel@ffwll.ch, jose.exposito89@gmail.com
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

Hi Thomas,

On Mon, Aug 08, 2022 at 02:54:06PM +0200, Thomas Zimmermann wrote:
> The name the parameter vmap to src in all functions. The parameter
> contains the locations of the source data and the new name says that.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks, this helped in readability!
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
