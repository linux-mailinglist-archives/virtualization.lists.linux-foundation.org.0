Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78E1FC202
	for <lists.virtualization@lfdr.de>; Wed, 17 Jun 2020 01:01:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 57053886ED;
	Tue, 16 Jun 2020 23:01:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8cTeb+Rb02Pl; Tue, 16 Jun 2020 23:01:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CA65F8879E;
	Tue, 16 Jun 2020 23:01:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9273EC07FF;
	Tue, 16 Jun 2020 23:01:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5B8CC016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 23:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 93989886B6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 23:01:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uDk3Bb47Te-A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 23:01:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C6B87886C8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 23:01:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6CB7AADA8;
 Tue, 16 Jun 2020 23:01:45 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 1AC8EDA7C3; Wed, 17 Jun 2020 01:01:30 +0200 (CEST)
Date: Wed, 17 Jun 2020 01:01:30 +0200
From: David Sterba <dsterba@suse.cz>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v4 0/3] mm, treewide: Rename kzfree() to kfree_sensitive()
Message-ID: <20200616230130.GJ27795@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Joe Perches <joe@perches.com>,
 Waiman Long <longman@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>,
 David Rientjes <rientjes@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mm@kvack.org,
 keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, ecryptfs@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-bluetooth@vger.kernel.org,
 linux-wpan@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-nfs@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-security-module@vger.kernel.org,
 linux-integrity@vger.kernel.org
References: <20200616015718.7812-1-longman@redhat.com>
 <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 linux-btrfs@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 David Sterba <dsterba@suse.cz>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-stm32@st-md-mailman.stormreply.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-scsi@vger.kernel.org, James Morris <jmorris@namei.org>,
 Matthew Wilcox <willy@infradead.org>, linux-wpan@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Waiman Long <longman@redhat.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 linux-pm@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-integrity@vger.kernel.org, linux-nfs@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, target-devel@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org
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
Reply-To: dsterba@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Jun 16, 2020 at 11:53:50AM -0700, Joe Perches wrote:
> On Mon, 2020-06-15 at 21:57 -0400, Waiman Long wrote:
> >  v4:
> >   - Break out the memzero_explicit() change as suggested by Dan Carpenter
> >     so that it can be backported to stable.
> >   - Drop the "crypto: Remove unnecessary memzero_explicit()" patch for
> >     now as there can be a bit more discussion on what is best. It will be
> >     introduced as a separate patch later on after this one is merged.
> 
> To this larger audience and last week without reply:
> https://lore.kernel.org/lkml/573b3fbd5927c643920e1364230c296b23e7584d.camel@perches.com/
> 
> Are there _any_ fastpath uses of kfree or vfree?

I'd consider kfree performance critical for cases where it is called
under locks. If possible the kfree is moved outside of the critical
section, but we have rbtrees or lists that get deleted under locks and
restructuring the code to do eg. splice and free it outside of the lock
is not always possible.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
