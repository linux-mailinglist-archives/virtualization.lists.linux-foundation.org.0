Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 211187372E
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:02:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 104FB14B1;
	Wed, 24 Jul 2019 18:59:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7EED01A06
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 12:20:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-162.sinamail.sina.com.cn (mail3-162.sinamail.sina.com.cn
	[202.108.3.162])
	by smtp1.linuxfoundation.org (Postfix) with SMTP id 73C34834
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 12:20:16 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([221.219.2.241])
	by sina.com with ESMTP
	id 5D1B4BFC0000072F; Tue, 2 Jul 2019 20:20:14 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 71389830408936
From: Hillf Danton <hdanton@sina.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: Reminder: 2 open syzbot bugs in vhost subsystem
Date: Tue,  2 Jul 2019 20:20:05 +0800
Message-Id: <20190702122005.2028-1-hdanton@sina.com>
MIME-Version: 1.0
Thread-Topic: Re: Reminder: 2 open syzbot bugs in vhost subsystem
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 24 Jul 2019 18:59:22 +0000
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	Eric Biggers <ebiggers@kernel.org>
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


On Tue, 2 Jul 2019 13:30:07 +0800 Jason Wang wrote:
> On 2019/7/2 Eric Biggers wrote:
> > [This email was generated by a script.  Let me know if you have any suggestions
> > to make it better, or if you want it re-generated with the latest status.]
> >
> > Of the currently open syzbot reports against the upstream kernel, I've manually
> > marked 2 of them as possibly being bugs in the vhost subsystem.  I've listed
> > these reports below, sorted by an algorithm that tries to list first the reports
> > most likely to be still valid, important, and actionable.
> >
> > Of these 2 bugs, 1 was seen in mainline in the last week.
> >
> > If you believe a bug is no longer valid, please close the syzbot report by
> > sending a '#syz fix', '#syz dup', or '#syz invalid' command in reply to the
> > original thread, as explained at https://goo.gl/tpsmEJ#status
> >
> > If you believe I misattributed a bug to the vhost subsystem, please let me know,
> > and if possible forward the report to the correct people or mailing list.
> >
> > Here are the bugs:
> >
> > --------------------------------------------------------------------------------
> > Title:              memory leak in vhost_net_ioctl
> > Last occurred:      0 days ago
> > Reported:           26 days ago
> > Branches:           Mainline
> > Dashboard link:     https://syzkaller.appspot.com/bug?id=3D12ba349d7e26ccfe95317bc376e812ebbae2ee0f
> > Original thread:    https://lkml.kernel.org/lkml/000000000000188da1058a9c25e3@google.com/T/#u
> >
> > This bug has a C reproducer.
> >
> > The original thread for this bug has received 4 replies; the last was 17 days
> > ago.
> >
> > If you fix this bug, please add the following tag to the commit:
> >      Reported-by: syzbot+0789f0c7e45efd7bb643@syzkaller.appspotmail.com
> >
> > If you send any email or patch for this bug, please consider replying to the
> > original thread.  For the git send-email command to use, or tips on how to reply
> > if the thread isn't in your mailbox, see the "Reply instructions" at
> > https://lkml.kernel.org/r/000000000000188da1058a9c25e3@google.com
> > 
> Cc Hillf who should had a fix for this.
> 
It could not be a fix in any form without the great idea you shared, Jason:)
while reviewing the first version.

> Hillf, would you please post a formal patch for this? (for -net)
> 
And feel free to do this thing appropriate or that thing for fixing the
reported memory leak before I can earn a Tested-by.

--
Hillf

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
