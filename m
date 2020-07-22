Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B362290FC
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 08:36:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 323E086A5C;
	Wed, 22 Jul 2020 06:36:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hvHorHzhVT6e; Wed, 22 Jul 2020 06:36:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7205F86AE6;
	Wed, 22 Jul 2020 06:36:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3EF37C016F;
	Wed, 22 Jul 2020 06:36:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A3E0C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 06:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DEE422039D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 06:36:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gp9azc+8cL2J
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 06:36:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id A63BE2039A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 06:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=iJ75CqVLwzufpVl7TOrDE+dI6rQEx49erHU0GlW5mZk=; b=a9dXBDxAmmzaG1GtIJffAtPthH
 y4WiXP/7qguBaDZIKPAV9hRcoJw974SpSyPgX4PWVnEi1FvyHgpSUtchsvbTL3o3gaSV3V0MNv8IM
 GpRAlA9q8gvPqAohT6qr5onMVwBRwC4Fx8cw/6+519rf88yXP3/ixAH9SGhCC3M6xLlHIQB3Zijt/
 ndDt3n5sPEPLk8pbUgh/z4UNee66RrT/pdWjw/YEsoTPbCxF25CBcGHCWfs0SL+SYs87mss9cPlmR
 xK/NQa97EFeRxaGqjvy4RhaUv0MY9VEDrx0WoUu+kRFai6T8muuTQBKtJXMczH3uiTMoVVDBp+uw6
 A4vxXogg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jy8Ml-0005U8-Gd; Wed, 22 Jul 2020 06:36:35 +0000
Date: Wed, 22 Jul 2020 07:36:35 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Adalbert Laz??r <alazar@bitdefender.com>
Subject: Re: [PATCH v9 01/84] signal: export kill_pid_info()
Message-ID: <20200722063635.GA20491@infradead.org>
References: <20200721210922.7646-1-alazar@bitdefender.com>
 <20200721210922.7646-2-alazar@bitdefender.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721210922.7646-2-alazar@bitdefender.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

On Wed, Jul 22, 2020 at 12:07:59AM +0300, Adalbert Laz??r wrote:
> From: Mathieu Tarral <mathieu.tarral@protonmail.com>
> 
> This function is used by VM introspection code to ungracefully shutdown
> a guest at the request of the introspection tool.
> 
> A security application will use this as the last resort to stop the
> spread of a malware from a guest.

I don't think your module has any business doing this.  If at all
it would be an EXPORT_SYMBOL_GPL, but the export is very questionable
and needs a much better justification.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
