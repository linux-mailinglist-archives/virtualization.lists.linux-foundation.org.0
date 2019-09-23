Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D03D6BB24F
	for <lists.virtualization@lfdr.de>; Mon, 23 Sep 2019 12:37:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C0839C74;
	Mon, 23 Sep 2019 10:37:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1209AC2A
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 10:36:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 60D368AC
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 10:36:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 803F7B018;
	Mon, 23 Sep 2019 10:36:56 +0000 (UTC)
Date: Mon, 23 Sep 2019 12:36:55 +0200
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC v3 1/9] ACPI: NUMA: export pxm_to_node
Message-ID: <20190923103655.GG6016@dhcp22.suse.cz>
References: <20190919142228.5483-1-david@redhat.com>
	<20190919142228.5483-2-david@redhat.com>
	<f4d8204e-71a1-855e-3992-35f7ec90440c@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4d8204e-71a1-855e-3992-35f7ec90440c@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-acpi@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Len Brown <lenb@kernel.org>
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

On Mon 23-09-19 12:13:11, David Hildenbrand wrote:
> On 19.09.19 16:22, David Hildenbrand wrote:
> > Will be needed by virtio-mem to identify the node from a pxm.
> > 
> > Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> > Cc: Len Brown <lenb@kernel.org>
> > Cc: linux-acpi@vger.kernel.org
> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > ---
> >  drivers/acpi/numa.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/acpi/numa.c b/drivers/acpi/numa.c
> > index eadbf90e65d1..d5847fa7ac69 100644
> > --- a/drivers/acpi/numa.c
> > +++ b/drivers/acpi/numa.c
> > @@ -35,6 +35,7 @@ int pxm_to_node(int pxm)
> >  		return NUMA_NO_NODE;
> >  	return pxm_to_node_map[pxm];
> >  }
> > +EXPORT_SYMBOL(pxm_to_node);
> 
> FWIW, this is a fairly old patch I dragged along and I think I'll
> convert this to EXPORT_SYMBOL_GPL now that I know better :)

All other exports in this file are EXPORT_SYMBOL. Why is this one
considered special to restrict the access?
-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
