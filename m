Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C122908A0
	for <lists.virtualization@lfdr.de>; Fri, 16 Oct 2020 17:38:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D7D67883E0;
	Fri, 16 Oct 2020 15:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FAkJQIfqnBRh; Fri, 16 Oct 2020 15:38:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D9F598832C;
	Fri, 16 Oct 2020 15:38:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEA28C0052;
	Fri, 16 Oct 2020 15:38:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8AFD3C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Oct 2020 15:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7750288BB9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Oct 2020 15:38:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bzp7W7NFJIkn
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Oct 2020 15:38:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8786888BB4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Oct 2020 15:38:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 26A7DADAB;
 Fri, 16 Oct 2020 15:38:29 +0000 (UTC)
To: Mike Rapoport <rppt@kernel.org>, Muchun Song <songmuchun@bytedance.com>
References: <20201010103854.66746-1-songmuchun@bytedance.com>
 <CAM_iQpUQXctR8UBNRP6td9dWTA705tP5fWKj4yZe9gOPTn_8oQ@mail.gmail.com>
 <CAMZfGtUhVx_iYY3bJZRY5s1PG0N1mCsYGS9Oku8cTqPiMDze-g@mail.gmail.com>
 <CANn89iKprp7WYeZy4RRO5jHykprnSCcVBc7Tk14Ui_MA9OK7Fg@mail.gmail.com>
 <CAMZfGtXVKER_GM-wwqxrUshDzcEg9FkS3x_BaMTVyeqdYPGSkw@mail.gmail.com>
 <9262ea44-fc3a-0b30-54dd-526e16df85d1@gmail.com>
 <CAMZfGtVF6OjNuJFUExRMY1k-EaDS744=nKy6_a2cYdrJRncTgQ@mail.gmail.com>
 <20201013080906.GD4251@kernel.org>
From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [External] Re: [PATCH] mm: proc: add Sock to /proc/meminfo
Message-ID: <8d1558e7-cd09-1f9e-edab-5f22c5bfc342@suse.cz>
Date: Fri, 16 Oct 2020 17:38:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201013080906.GD4251@kernel.org>
Content-Language: en-US
Cc: Miaohe Lin <linmiaohe@huawei.com>, Feng Tang <feng.tang@intel.com>,
 Michal Hocko <mhocko@suse.com>, rafael@kernel.org, Neil Brown <neilb@suse.de>,
 Alexei Starovoitov <ast@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, Eric Dumazet <edumazet@google.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Michel Lespinasse <walken@google.com>, Will Deacon <will@kernel.org>,
 Steffen Klassert <steffen.klassert@secunet.com>, dave@stgolabs.net,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Eric Dumazet <eric.dumazet@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dexuan Cui <decui@microsoft.com>, Peter Zijlstra <peterz@infradead.org>,
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Sami Tolvanen <samitolvanen@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Shakeel Butt <shakeelb@google.com>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Cong Wang <xiyou.wangcong@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org, chenqiwu@xiaomi.com,
 Martin KaFai Lau <kafai@fb.com>, Jakub Sitnicki <jakub@cloudflare.com>,
 christophe.leroy@c-s.fr, Willem de Bruijn <willemb@google.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Florian Westphal <fw@strlen.de>, gustavoars@kernel.org,
 Roman Gushchin <guro@fb.com>, Minchan Kim <minchan@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Linux Kernel Network Developers <netdev@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, David Miller <davem@davemloft.net>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 10/13/20 10:09 AM, Mike Rapoport wrote:
>> We are not complaining about TCP using too much memory, but how do
>> we know that TCP uses a lot of memory. When I firstly face this problem,
>> I do not know who uses the 25GB memory and it is not shown in the /proc/meminfo.
>> If we can know the amount memory of the socket buffer via /proc/meminfo, we
>> may not need to spend a lot of time troubleshooting this problem. Not everyone
>> knows that a lot of memory may be used here. But I believe many people
>> should know /proc/meminfo to confirm memory users.
> If I undestand correctly, the problem you are trying to solve is to
> simplify troubleshooting of memory usage for people who may not be aware
> that networking stack can be a large memory consumer.
> 
> For that a paragraph in 'man 5 proc' maybe a good start:

Yeah. Another major consumer that I've seen at some point was xfs buffers. And 
there might be others, and adding everything to /proc/meminfo is not feasible. I 
have once proposed adding a counter called "Unaccounted:" which would at least 
tell the user easily if a significant portion is occupied by memory not 
explained by the other meminfo counters, and look for trends (increase = 
potential memory leak?). For specific prominent consumers not covered by meminfo 
but that have some kind of internal counters, we could document where to look, 
such as /proc/net/sockstat or maybe create some /proc/ or /sys directory with 
file per consumer so that it's still easy to check, but without the overhead of 
global counters and bloated /proc/meminfo?

>  From ddbcf38576d1a2b0e36fe25a27350d566759b664 Mon Sep 17 00:00:00 2001
> From: Mike Rapoport<rppt@linux.ibm.com>
> Date: Tue, 13 Oct 2020 11:07:35 +0300
> Subject: [PATCH] proc.5: meminfo: add not anout network stack memory
>   consumption
> 
> Signed-off-by: Mike Rapoport<rppt@linux.ibm.com>
> ---
>   man5/proc.5 | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index ed309380b..8414676f1 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -3478,6 +3478,14 @@ Except as noted below,
>   all of the fields have been present since at least Linux 2.6.0.
>   Some fields are displayed only if the kernel was configured
>   with various options; those dependencies are noted in the list.
> +.IP
> +Note that significant part of memory allocated by the network stack
> +is not accounted in the file.
> +The memory consumption of the network stack can be queried
> +using
> +.IR /proc/net/sockstat
> +or
> +.BR ss (8)
>   .RS
>   .TP
>   .IR MemTotal " %lu"
> -- 2.25.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
