Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBA9F52D8
	for <lists.virtualization@lfdr.de>; Fri,  8 Nov 2019 18:48:56 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 699BADAC;
	Fri,  8 Nov 2019 17:48:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B6E13CD4
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 17:48:48 +0000 (UTC)
X-Greylist: delayed 00:06:41 by SQLgrey-1.7.6
Received: from iolanthe.rowland.org (iolanthe.rowland.org [192.131.102.54])
	by smtp1.linuxfoundation.org (Postfix) with SMTP id 20F0E8AA
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 17:48:47 +0000 (UTC)
Received: (qmail 4415 invoked by uid 2102); 8 Nov 2019 12:42:05 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
	by localhost with SMTP; 8 Nov 2019 12:42:05 -0500
Date: Fri, 8 Nov 2019 12:42:05 -0500 (EST)
From: Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 10/13] tools/memory-model: Remove
	smp_read_barrier_depends() from informal doc
In-Reply-To: <20191108170120.22331-11-will@kernel.org>
Message-ID: <Pine.LNX.4.44L0.1911081241460.1498-100000@iolanthe.rowland.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Arnd Bergmann <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Josh Triplett <josh@joshtriplett.org>, linux-kernel@vger.kernel.org,
	SeongJae Park <sj38.park@gmail.com>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	linux-alpha@vger.kernel.org, Joe Perches <joe@perches.com>,
	Matt Turner <mattst88@gmail.com>, Yunjae Lee <lyj7694@gmail.com>,
	virtualization@lists.linux-foundation.org,
	Boqun Feng <boqun.feng@gmail.com>, Richard Henderson <rth@twiddle.net>
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

On Fri, 8 Nov 2019, Will Deacon wrote:

> 'smp_read_barrier_depends()' has gone the way of mmiowb() and so many
> esoteric memory barriers before it. Drop the two mentions of this
> deceased barrier from the LKMM informal explanation document.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  .../Documentation/explanation.txt             | 26 +++++++++----------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/memory-model/Documentation/explanation.txt b/tools/memory-model/Documentation/explanation.txt
> index 488f11f6c588..3050bf67b8d0 100644
> --- a/tools/memory-model/Documentation/explanation.txt
> +++ b/tools/memory-model/Documentation/explanation.txt
> @@ -1118,12 +1118,10 @@ maintain at least the appearance of FIFO order.
>  In practice, this difficulty is solved by inserting a special fence
>  between P1's two loads when the kernel is compiled for the Alpha
>  architecture.  In fact, as of version 4.15, the kernel automatically
> -adds this fence (called smp_read_barrier_depends() and defined as
> -nothing at all on non-Alpha builds) after every READ_ONCE() and atomic
> -load.  The effect of the fence is to cause the CPU not to execute any
> -po-later instructions until after the local cache has finished
> -processing all the stores it has already received.  Thus, if the code
> -was changed to:
> +adds this fence after every READ_ONCE() and atomic load on Alpha.  The
> +effect of the fence is to cause the CPU not to execute any po-later
> +instructions until after the local cache has finished processing all
> +the stores it has already received.  Thus, if the code was changed to:
>  
>  	P1()
>  	{
> @@ -1142,14 +1140,14 @@ READ_ONCE() or another synchronization primitive rather than accessed
>  directly.
>  
>  The LKMM requires that smp_rmb(), acquire fences, and strong fences
> -share this property with smp_read_barrier_depends(): They do not allow
> -the CPU to execute any po-later instructions (or po-later loads in the
> -case of smp_rmb()) until all outstanding stores have been processed by
> -the local cache.  In the case of a strong fence, the CPU first has to
> -wait for all of its po-earlier stores to propagate to every other CPU
> -in the system; then it has to wait for the local cache to process all
> -the stores received as of that time -- not just the stores received
> -when the strong fence began.
> +share this property: They do not allow the CPU to execute any po-later
> +instructions (or po-later loads in the case of smp_rmb()) until all
> +outstanding stores have been processed by the local cache.  In the
> +case of a strong fence, the CPU first has to wait for all of its
> +po-earlier stores to propagate to every other CPU in the system; then
> +it has to wait for the local cache to process all the stores received
> +as of that time -- not just the stores received when the strong fence
> +began.
>  
>  And of course, none of this matters for any architecture other than
>  Alpha.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
