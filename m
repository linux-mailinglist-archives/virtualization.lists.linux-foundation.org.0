Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F67E69488
	for <lists.virtualization@lfdr.de>; Mon, 15 Jul 2019 16:52:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4E896F1D;
	Mon, 15 Jul 2019 14:52:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 431FD9D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 14:52:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C78D888E
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 14:52:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id B6CA2B0B8;
	Mon, 15 Jul 2019 14:52:12 +0000 (UTC)
Subject: Re: [PATCH] x86/paravirt: Drop {read,write}_cr8() hooks
To: Andy Lutomirski <luto@kernel.org>
References: <20190715130056.10627-1-andrew.cooper3@citrix.com>
	<a04918d1-975e-5869-1ecd-c9df4ae5b1c1@suse.com>
	<CALCETrX0T=vzyN8gqoBmA72xwzS45d5bDTfcZQJayht9n9ijPA@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <f51ce980-599b-cae3-e3fa-4a67443ea128@suse.com>
Date: Mon, 15 Jul 2019 16:52:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CALCETrX0T=vzyN8gqoBmA72xwzS45d5bDTfcZQJayht9n9ijPA@mail.gmail.com>
Content-Language: de-DE
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: FengTang <feng.tang@intel.com>, Peter Zijlstra <peterz@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	X86 ML <x86@kernel.org>, "Rafael J.Wysocki" <rjw@rjwysocki.net>,
	LKML <linux-kernel@vger.kernel.org>, Stephane Eranian <eranian@google.com>,
	Linux Virtualization <virtualization@lists.linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>, Pavel Machek <pavel@ucw.cz>,
	Nadav Amit <namit@vmware.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alok Kataria <akataria@vmware.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On 15.07.19 16:26, Andy Lutomirski wrote:
> On Mon, Jul 15, 2019 at 6:23 AM Juergen Gross <jgross@suse.com> wrote:
>>
>> On 15.07.19 15:00, Andrew Cooper wrote:
>>> There is a lot of infrastructure for functionality which is used
>>> exclusively in __{save,restore}_processor_state() on the suspend/resume
>>> path.
>>>
>>> cr8 is an alias of APIC_TASKPRI, and APIC_TASKPRI is saved/restored
>>> independently by lapic_{suspend,resume}().
>>
>> Aren't those called only with CONFIG_PM set?
>>
> 
> 
> Unless I'm missing something, we only build any of the restore code
> (including the write_cr8() call) if CONFIG_PM_SLEEP is set, and that
> selects CONFIG_PM, so we should be fine, I think.
> 

Okay, in that case I'd suggest to remove "cr8" from struct saved_context
as it won't be used any longer.


Juergen
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
