Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B82AC1EA2BB
	for <lists.virtualization@lfdr.de>; Mon,  1 Jun 2020 13:34:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 627291FF59;
	Mon,  1 Jun 2020 11:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V5qYF4jdcVUE; Mon,  1 Jun 2020 11:34:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2E1E320035;
	Mon,  1 Jun 2020 11:34:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 042E8C0176;
	Mon,  1 Jun 2020 11:34:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94899C0176
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 11:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 809D786DD6
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 11:34:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ihQH1TC-gS4s
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 11:34:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8FA7A866F0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 11:34:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 54BD1AECB;
 Mon,  1 Jun 2020 11:34:26 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 1217B1E0948; Mon,  1 Jun 2020 13:34:24 +0200 (CEST)
Date: Mon, 1 Jun 2020 13:34:24 +0200
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 1/2] docs: mm/gup: pin_user_pages.rst: add a "case 5"
Message-ID: <20200601113424.GF3960@quack2.suse.cz>
References: <20200601052633.853874-1-jhubbard@nvidia.com>
 <20200601052633.853874-2-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200601052633.853874-2-jhubbard@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Dave Chinner <david@fromorbit.com>,
 LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Souptick Joarder <jrdr.linux@gmail.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Sun 31-05-20 22:26:32, John Hubbard wrote:
> There are four cases listed in pin_user_pages.rst. These are
> intended to help developers figure out whether to use
> get_user_pages*(), or pin_user_pages*(). However, the four cases
> do not cover all the situations. For example, drivers/vhost/vhost.c
> has a "pin, write to page, set page dirty, unpin" case.
> =

> Add a fifth case, to help explain that there is a general pattern
> that requires pin_user_pages*() API calls.
> =

> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jan Kara <jack@suse.cz>
> Cc: J=E9r=F4me Glisse <jglisse@redhat.com>
> Cc: Dave Chinner <david@fromorbit.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-fsdevel@vger.kernel.org
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  Documentation/core-api/pin_user_pages.rst | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> =

> diff --git a/Documentation/core-api/pin_user_pages.rst b/Documentation/co=
re-api/pin_user_pages.rst
> index 4675b04e8829..6068266dd303 100644
> --- a/Documentation/core-api/pin_user_pages.rst
> +++ b/Documentation/core-api/pin_user_pages.rst
> @@ -171,6 +171,24 @@ If only struct page data (as opposed to the actual m=
emory contents that a page
>  is tracking) is affected, then normal GUP calls are sufficient, and neit=
her flag
>  needs to be set.
>  =

> +CASE 5: Pinning in order to write to the data within the page
> +-------------------------------------------------------------
> +Even though neither DMA nor Direct IO is involved, just a simple case of=
 "pin,
> +write to a page's data, unpin" can cause a problem. Case 5 may be consid=
ered a
> +superset of Case 1, plus Case 2, plus anything that invokes that pattern=
. In
> +other words, if the code is neither Case 1 nor Case 2, it may still requ=
ire
> +FOLL_PIN, for patterns like this:
> +
> +Correct (uses FOLL_PIN calls):
> +    pin_user_pages()
> +    write to the data within the pages
> +    unpin_user_pages()
> +
> +INCORRECT (uses FOLL_GET calls):
> +    get_user_pages()
> +    write to the data within the pages
> +    put_page()
> +
>  page_maybe_dma_pinned(): the whole point of pinning
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>  =

> -- =

> 2.26.2
> =

-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
